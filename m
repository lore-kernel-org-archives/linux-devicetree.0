From: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Subject: Re: [PATCH v4 00/12] [dt-bindings] [media] Add document file and
 driver for Sony CXD2880 DVB-T2/T tuner + demodulator
Date: Wed, 13 Dec 2017 17:36:33 -0200
Message-ID: <20171213173633.57edca85@vento.lan>
References: <20171013054635.20946-1-Yasunari.Takiguchi@sony.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171013054635.20946-1-Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Masayuki.Yamamoto-7U/KSKJipcs@public.gmane.org, Hideki.Nozawa-7U/KSKJipcs@public.gmane.org, Kota.Yonezawa-7U/KSKJipcs@public.gmane.org, Toshihiko.Matsumoto-7U/KSKJipcs@public.gmane.org, Satoshi.C.Watanabe-7U/KSKJipcs@public.gmane.org, "Bird, Timothy" <Tim.Bird-7U/KSKJipcs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Em Fri, 13 Oct 2017 14:46:35 +0900
<Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org> escreveu:

> From: Yasunari Takiguchi <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
> 
> Hi,
> 
> This is the patch series (version 4) of Sony CXD2880 DVB-T2/T tuner + 
> demodulator driver.The driver supports DVB-API and interfaces through 
> SPI.
> 
> We have tested the driver on Raspberry Pi 3 and got picture and sound 
> from a media player.
> 
> The change history of this patch series is as below.

Finally had time to review this patch series. Sorry for taking so long.
4Q is usually very busy.

I answered each patch with comments. There ones I didn't comment
(patches 1, 4 and 8-12) is because I didn't see anything wrong,
except for the notes I did on other patches, mainly:
	- they lack SPDX license text;
	- the error codes need to review.

Additionally, on patches 8-11, I found weird to not found any
64 bits division, but I noticed some code there that it seemed
to actually be doing such division using some algorithm to make
them work on 32 bits machine. If so, please replace them by
do_div64(), as it makes clearer about what's been doing, and it
provides better performance when compiled on 64 bit Kernels (as
they become just a DIV asm operation).

Regards,
Mauro

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
