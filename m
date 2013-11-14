From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 5/5] OF: Introduce utility helper functions
Date: Thu, 14 Nov 2013 10:44:20 +0900
Message-ID: <20131114014420.E871CC4054D@trevor.secretlab.ca>
References: <1383673816-29293-1-git-send-email-panto@antoniou-consulting.com> <1383673816-29293-6-git-send-email-panto@antoniou-consulting.com> <20131111163743.D136CC42330@trevor.secretlab.ca> <89491720-464B-47EC-A888-9CDE29B035F5@antoniou-consulting.com> <20131113013459.D3886C40F49@trevor.secretlab.ca> <F88335D9-6515-4E48-A21F-25039F16754A@antoniou-consulting.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <F88335D9-6515-4E48-A21F-25039F16754A-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 13 Nov 2013 10:03:37 +0100, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> On Nov 13, 2013, at 2:34 AM, Grant Likely wrote:
> > On Tue, 12 Nov 2013 11:39:08 +0100, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> >>> On Tue,  5 Nov 2013 19:50:16 +0200, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> >>>> +	} else {
> >>>> +		pr_warn("%s: node %p cannot be freed; memory is gone\n",
> >>>> +				__func__, node);
> >>>> +	}
> >>>> +}
> >>> 
> >>> All of the above is potentially dangerous. There is no way to determine
> >>> if anything still holds a reference to a node. The proper way to handle
> >>> removal of properties is to have a release method when the last
> >>> of_node_put is called.
> >>> 
> >> 
> >> This is safe, and expected to be called only on a dynamically created tree,
> >> that's what all the checks against OF_DYNAMIC guard against.
> >> 
> >> It is not ever meant to be called on an arbitrary tree, created by unflattening
> >> a blob.
> > 
> > I am talking about when being used on a dynamic tree. The problem is
> > when a driver or other code holds a reference to a dynamic nodes, but
> > doesn't release it correctly. The memory must not be freed until all of
> > the references are relased. OF_DYNAMIC doesn't actually help in that
> > case, and it is the reason for of_node_get()/of_node_put()
> > 
> 
> I know, but even that is not enough. of_node_get()/of_node_put() handles the
> case of references to the nodes, but not what happens with references to
> properties. deadprops is mitigating the problem somewhat, but if we're going
> to go to all the trouble of kobjectification let's do the props as well.
> 
> of_get_property could be modified to return a devm_kmalloced copy of the real
> property and that would deal with most of the callers. Of course for
> the small sized scalar data we can avoid the copy.
> 
> By using the devm_* interface we also avoid having to mess too much with the callers.
> 
> I.e. what about something like devm_of_get_property()?

Reference counting is already a horrible pain to keep correct. I don't
see a better way to handle it in the dynamic case, so we're stuck with
it, but I don't want to make it any harder. Adding ref counting to
properties will make it harder than it already is to get the code right.
I'm absolutely fine with a little bit of wasted memory in the form of
deadprops when the alternative is so horrible. References at the node
level is enough granularity.

I don't think kduping the property is the solution either. I strongly
suspect that will be far more expensive than the deadprop solution.

> >>>> +{
> >>>> +	struct device_node *node;
> >>>> +
> >>>> +	node = kzalloc(sizeof(*node), flags);
> >>>> +	if (node == NULL)
> >>>> +		return NULL;
> >>>> +
> >>>> +	node->name = kstrdup(name, flags);
> >>>> +	if (node->name == NULL)
> >>>> +		goto err_return;
> >>>> +
> >>>> +	node->type = kstrdup(type, flags);
> >>>> +	if (node->type == NULL)
> >>>> +		goto err_return;
> >>>> +
> >>>> +	node->full_name = kstrdup(full_name, flags);
> >>>> +	if (node->type == NULL)
> >>>> +		goto err_return;
> >>> 
> >>> Again, who do you expect the user of this function to be? If it is part
> >>> of unflattening an overlay tree, is there a reason that the passed in
> >>> names cannot be used directly instead of kmallocing them?
> >>> 
> >> 
> >> I want to be able to get rid of the blob eventually; I don't need to keep
> >> dragging it around.
> > 
> > Why? It really doesn't hurt and it means data does not need to be
> > copied.
> 
> Copying data lead to less problems that having to drag that blob around. 
> That's just preference, so not a big issue.

Can you elaborate? What problems do you foresee being created by keeping
the blob?

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
