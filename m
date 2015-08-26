From: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: add Hi6220 mailbox node
Date: Wed, 26 Aug 2015 10:41:52 +0800
Message-ID: <1440556912.10987.54.camel@linaro.org>
References: <20150824095144.GA7139@leverpostej>
	 <1440411596.3517.12.camel@linaro.org>
	 <20150824114903.GT10728@bivouac.eciton.net>
	 <1440490427.10987.29.camel@linaro.org>
	 <20150825094630.GU10728@bivouac.eciton.net>
	 <1440497710.10987.42.camel@linaro.org> <20150825104256.GB13471@leverpostej>
	 <1440510194.10987.52.camel@linaro.org>
	 <20150825142416.GW10728@bivouac.eciton.net>
	 <CAKv+Gu-b=QvMF++V9UjULRxrGvoz-0ytFLeuLm8Y5sQH4p53Sw@mail.gmail.com>
	 <20150825153754.GY10728@bivouac.eciton.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150825153754.GY10728-t77nlHhSwNqAroYi2ySoxKxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jian Zhang <zhangjian001-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Guangyue Zeng <zengguangyue-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Yiping Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhenwei Wang <Zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "kongfei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <kongfei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Haoju Mo <mohaoju-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <guodong.xu@l>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-08-25 at 16:37 +0100, Leif Lindholm wrote:
> On Tue, Aug 25, 2015 at 04:51:22PM +0200, Ard Biesheuvel wrote:
> > >>    Arm kernel should either fetch memory information from
> > >>    efi or DT.
> > >
> > > Absolutely.
> > >
> > >>    Currently arm kernel fetch both efi memory information and
> > >>    reserved buffer from DTB at the same time.
> > >
> > > No, it does not.
> > 
> > It should not, but it does. Due to an oversight, the stub removes
> > /memreserve/ entries but ignores the reserved-memory node completely.
> 
> Urgh.
> 
> > This was reported here in fact
> > 
> > http://thread.gmane.org/gmane.linux.kernel.efi/5736/focus=5742
> > 
> > but there has not been a followup to this series.
> 
> Are all of those patches still relevant, or did some of them go in
> already?
> 
> Haojian: can you give that patch a spin and see if it does what you
> need, combined with adding the reserved areas to the UEFI memory map?
> 
> /
>     Leif

It's so nice. This patch is what I need.

Thanks
Haojian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
