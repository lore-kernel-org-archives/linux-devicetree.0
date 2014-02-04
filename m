From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: RE: [PATCH] of: fix of_update_property()
Date: Tue, 04 Feb 2014 17:26:59 +0000
Message-ID: <20140204172659.CEA26C4050F@trevor.secretlab.ca>
References: <1389933996-19306-1-git-send-email-Li.Xiubo@freescale.com> < CAL_JsqJuAv8=pBuzYO5ZGzroD1kq6gjmNsTjoVyXR=vcu+-pTA@mail.gmail.com> < b61be84c13ed4056a62743e16beb70f2@BY2PR03MB505.namprd03.prod.outlook.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b61be84c13ed4056a62743e16beb70f2-+7O3WWA3DPshjIn37xzcLOO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 20 Jan 2014 05:50:17 +0000, "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > Subject: Re: [PATCH] of: fix of_update_property()
> > 
> > On Thu, Jan 16, 2014 at 10:46 PM, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > The of_update_property() is intent to update a property in a node
> > 
> > s/intent/indended/
> > 
> > > and if the property does not exist, will add it to the node.
> > >
> > > The second search of the property is possibly won't be found, that
> > > maybe removed by other thread just before the second search begain,
> > > if so just retry it.
> > 
> > How did you find this problem? Actual use or some artificial stress test?
> >
> 
> Some artificial stress test at home.

Can you reproduce those tests? It would be nice to have the selftests in
the kernel so that we can regression test for problems like this.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
