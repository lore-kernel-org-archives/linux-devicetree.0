From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v7 3/4] drivers: of: add initialization code for dma reserved memory
Date: Sun, 15 Sep 2013 13:50:18 +0100
Message-ID: <20130915125018.D51F0C42C64@trevor.secretlab.ca>
References: <1377527959-5080-1-git-send-email-m.szyprowski@samsung.com> <1377527959-5080-4-git-send-email-m.szyprowski@samsung.com> <20130829224637.D09183E1222@localhost> <52209278.8040106@samsung.com> <DAF223EB-C84C-4E82-A24A-ACD0A3A0559F@codeaurora.org> <20130909160154.8D7183E0F23@localhost> <13185491-534E-4547-8412-5704346EA2DC@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <13185491-534E-4547-8412-5704346EA2DC-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 12 Sep 2013 13:22:25 -0500, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> 
> On Sep 9, 2013, at 11:01 AM, Grant Likely wrote:
> 
> > 
> > The generic form for do-not-touch memory:
> > 	compatible = "reserved-memory";
> > - I've dropped '-region' because I think it is redundant
> > - The kernel will not make use of this memory except for when a driver picks it up
> > 
> > For contiguous memory:
> > 	compatible = "contiguous-memory", "reserved-memory"
> 
> Should the phandle references still be 'memory-region' ?

I would think so.

It is only redundent in the reserved region node because the binding
says the node is a child of the "reserved-regions" node.  :-)

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
