From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 06/12] arm64: dts: mt7622: add cpufreq related device
 nodes
Date: Thu, 4 Jan 2018 18:01:14 +0800
Message-ID: <1515060074.30687.62.camel@mtkswgap22>
References: <cover.1515057696.git.sean.wang@mediatek.com>
         <7e61305594b7bbcdefe31f64ca5603cbdbd9f4cf.1515057696.git.sean.wang@mediatek.com>
         <20180104094526.GC19742@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180104094526.GC19742@vireshk-i7>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-01-04 at 15:15 +0530, Viresh Kumar wrote:
> On 04-01-18, 17:40, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > index 5b7f0a3..90b2761 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > @@ -18,6 +18,50 @@
> >  	#address-cells = <2>;
> >  	#size-cells = <2>;
> >  
> > +	cpu_opp_table: opp_table {
> 
> Rob recently asked me to do name the nodes with "-" instead of "_". So
> this becomes "cpu_opp_table: opp-table {" then.
> 

okay, I will do it in the next version.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
