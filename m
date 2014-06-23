From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: OF_DYNAMIC node lifecycle
Date: Mon, 23 Jun 2014 21:21:35 +0100
Message-ID: <20140623202135.CC0C7C4094C@trevor.secretlab.ca>
References: <CACxGe6tsXuLZT=h8S0yRPRPy6Hqz1xkX8G+ViY0cxEUuxZ1dsw@mail.gmail.com>
	<43898B58-2EA7-42B5-A17A-27F16F2618A6@konsulko.com>
	<20140623145844.DA6A3C40AE5@trevor.secretlab.ca>
	<5213060A-74FB-4CD6-BF1C-4B7DCA98BE51@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5213060A-74FB-4CD6-BF1C-4B7DCA98BE51-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 23 Jun 2014 18:26:04 +0300, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> On Jun 23, 2014, at 5:58 PM, Grant Likely wrote:
> > We'll also need a transition plan to move to RCU. I think the existing
> > iterators can be modified to do the rcu locking in-line, but still require
> > the of_node_get/put stuff (basically, so existing code continue to works
> > unchanged). Then we can add _rcu versions that drop the need for
> > of_node_get/put(). When everything is converted, the old iterators can
> > be dropped.
> > 
> 
> Eventually yes. We're not close to that yet. I'd be happy if we get the 
> lifecycle issues fixed right now (with of_node_get/put) and plan ahead.
> I am sure we missed a few things, which we will come across.

If we agree on the plan to keep of_node_get/put, but strongly reduce the
usage by switching to RCU, then I'm generally okay with proceeding with
the overlay feature because I can see how it would work in the new
model.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
