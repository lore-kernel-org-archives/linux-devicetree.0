From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH] dtc: Dynamic symbols & fixup support (v2)
Date: Tue, 5 Nov 2013 09:49:16 +0200
Message-ID: <902DDACA-06A4-443D-AF96-72F947171F83@antoniou-consulting.com>
References: <1383575773-7296-1-git-send-email-panto@antoniou-consulting.com> <1383599845.10624.3.camel@linux-builds1> <CADhT+wcgs2cQv23+K7EooZaA0KK7Lk8zY-KAPc50xUdm5BFRZw@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADhT+wcgs2cQv23+K7EooZaA0KK7Lk8zY-KAPc50xUdm5BFRZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Dinh,

No worries :)

On Nov 4, 2013, at 11:26 PM, Dinh Nguyen wrote:

> 
> 
> 
> On Mon, Nov 4, 2013 at 3:17 PM, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org> wrote:
> On Mon, 2013-11-04 at 16:36 +0200, Pantelis Antoniou wrote:
> > Enable the generation of symbol & fixup information for
> > usage with dynamic DT loading.
> >
> > Passing the -@ option generates a __symbols__ node at the
> > root node of the resulting blob for any node labels used.
> >
> > When using the /plugin/ tag all unresolved label references
> > be tracked in the __fixups__ node, while all local phandle
> > references will the tracked in the __local_fixups__ node.
> >
> > This is sufficient to implement a dynamic DT object loader.
> >
> > Changes since v1:
> >
> > * Forward ported to 1.4 version
> > * Added manual entries for the -@ option
> >
> > Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> > ---
> 
> Can I ask what repo/branch this is based on? It did not apply cleanly
> for me on 1.4.
> 
> Never mind...please ignore. It applies clean for me now. Giving it a go..
> Sorry for the noise.
> 
> Dinh 
> 
> I would like to test it along with the FPGA manager.
> 
> Thanks,
> Dinh
> 

Regards

-- Pantelis

> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
