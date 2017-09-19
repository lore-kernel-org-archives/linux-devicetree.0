From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 1/2] drm/bridge: Add Cadence DSI driver
Date: Tue, 19 Sep 2017 16:38:31 +0300
Message-ID: <2ccf3816-8a98-5626-7e4e-1dd13f167811@ti.com>
References: <20170831155519.3704-1-boris.brezillon@free-electrons.com>
 <70f446c1-64d8-928c-4ea7-aa16dda12253@ti.com>
 <20170919152533.78fb2b3e@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170919152533.78fb2b3e@bbrezillon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=EF=BB=BF
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki

On 19/09/17 16:25, Boris Brezillon wrote:
> On Tue, 19 Sep 2017 15:59:20 +0300
> Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:
>=20
>> =EF=BB=BFHi Boris,
>>
>>
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus=
/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>>
>> On 31/08/17 18:55, Boris Brezillon wrote:
>>> Add a driver for Cadence DPI -> DSI bridge.
>>>
>>> This driver only support a subset of Cadence DSI bridge capabilities.
>>>
>>> Here is a non-exhaustive list of missing features:
>>>  * burst mode
>>>  * dynamic configuration of the DPHY based on the
>>>  * support for additional input interfaces (SDI input)
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =20
>>
>> <snip>
>>
>>> +	dsi->pclk =3D devm_clk_get(&pdev->dev, "pclk");
>>> +	if (IS_ERR(dsi->pclk))
>>> +		return PTR_ERR(dsi->pclk); =20
>>
>> What's the purpose of pclk? Isn't that normally dealt with the normal
>> modesetting, enabled with the video stream? How could it even be enabled
>> here, without anyone setting the rate?
>=20
> It's the peripheral clock, not the pixel clock, and AFAIU it has to be
> enabled before accessing DSI registers.

Is that the dsi_p_clk? I can't find "peripheral clock" in the specs.

I think calling it "pclk" in a display driver is very confusing, as
pclk, at least for me, always means pixel clock =3D).

 Tomi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
