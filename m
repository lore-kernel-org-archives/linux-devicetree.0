From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/3] dtc: Keep type information from DTS
Date: Mon, 23 Dec 2013 20:16:46 +0100
Message-ID: <1671693.Jr1CHV0T8t@amdc1227>
References: <1386953352-25402-1-git-send-email-t.figa@samsung.com>
 <1386953352-25402-2-git-send-email-t.figa@samsung.com>
 <52AF41A1.3000508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <52AF41A1.3000508-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 16 of December 2013 11:08:33 Stephen Warren wrote:
> On 12/13/2013 09:49 AM, Tomasz Figa wrote:
> > Currently dtc loses information about data types when parsing DTS,
> > because it flattens all the parsed property data into a flat stream of
> > bytes. The only saved metadata is for references to other nodes inside
> > cell arrays. This makes it impossible to do any checks on data types on
> > livetree representation.
> > 
> > This patch makes dtc store type information inside data struct by using
> > marker infrastructure. A new type of marker is introduced that holds
> > type enum as its ref member. Such markers are then inserted wherever
> > data of given type starts, so information about type of each property
> > data section is preserved.
> 
> > diff --git a/dtc-parser.y b/dtc-parser.y
> 
> >  	| propdataprefix DT_REF
> >  		{
> > -			$$ = data_add_marker($1, REF_PATH, $2);
> > +			struct data d;
> > +			d = data_add_marker($1, TYPE, (char *)TYPE_STRING);
> > +			$$ = data_add_marker(d, REF_PATH, $2);
> >  		}
> 
> I guess here, the lexer does give us a string that's the target of the
> reference, so this is correct. However, I wonder if semantically we
> shouldn't call this a TYPE_REFERENCE, so we can distinguish between
> references and regular strings?

Hmm, a REF_PATH tag is already being added by this code, so you don't lose
this information. Still, maybe it would be better to unify REF_* and TYPE
tags and add TYPE_PATH and TYPE_PHANDLE types...

> 
> > diff --git a/livetree.c b/livetree.c
> 
> > @@ -530,16 +530,24 @@ cell_t get_node_phandle(struct node *root, struct node *node)
> >  	node->phandle = phandle;
> >  
> >  	if (!get_property(node, "linux,phandle")
> > -	    && (phandle_format & PHANDLE_LEGACY))
> > +	    && (phandle_format & PHANDLE_LEGACY)) {
> > +		struct data d;
> > +
> > +		d = data_add_marker(empty_data, TYPE, (char *)TYPE_ARRAY_INT32);
> 
> Similarly here, can we encode as e.g. TYPE_PHANDLE or something like
> that, so we keep the semantic information?

"linux,phandle" property isn't really a phandle (as in reference by
phandle), but an integer assigning phandle number for given node, so
I'm not sure if TYPE_PHANDLE would be correct here.

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
