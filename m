From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: RE: [PATCH 1/2] drm/fsl-dcu: update the panel dt binding document
Date: Tue, 28 Jun 2016 22:40:21 -0700
Message-ID: <07c63c143fb17d689fda21a580acb0f5@agner.ch>
References: <1467106748-19314-1-git-send-email-meng.yi@nxp.com>
 <20160628210748.GA10847@rob-hp-laptop>
 <8e8820c0ccfa8e1348a038959da850f8@agner.ch>
 <HE1PR04MB1051B76708D9E3F0F3DB4C56EC230@HE1PR04MB1051.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <HE1PR04MB1051B76708D9E3F0F3DB4C56EC230-6LN7OEpIatUZ5NoXM8MaPs9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-06-28 19:58, Meng Yi wrote:
>> >>  Optional properties:
>> >>  - fsl,tcon:		The phandle to the timing controller node.
>> >> @@ -24,6 +24,11 @@ dcu: dcu@2ce0000 {
>> >>  	clocks = <&platform_clk 0>, <&platform_clk 0>;
>> >>  	clock-names = "dcu", "pix";
>> >>  	big-endian;
>> >> -	fsl,panel = <&panel>;
>> >>  	fsl,tcon = <&tcon>;
>> >> +
>> >> +	port: port@0 {
>> >
>> > Drop the unit address. With that,
>>
>> I was going to say add a corresponding reg property and specify address-cells.
>>
> 
> For now, we only have one 'remote-endpoint', you mean maybe we should
> use 'ports' that prepare for multiple connections?
> 

I ment to add the address because most drivers do. But then, most
drivers support multiple ports.

>> So is it ok to also create a port without address?
>>
> 
> It works fine, I think it is ok.

I guess it is ok too since Rob suggested it. However, consequently I
also would drop the unit address of the port node inside the panel node.

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
