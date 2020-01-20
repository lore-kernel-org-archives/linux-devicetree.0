Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30CDC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 15:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B17521D7E
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 15:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3KHWKsz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbgATPGL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 10:06:11 -0500
Received: from mail-wm1-f46.google.com ([209.85.128.46]:52572 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728760AbgATPGK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 10:06:10 -0500
Received: by mail-wm1-f46.google.com with SMTP id p9so14850666wmc.2;
        Mon, 20 Jan 2020 07:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jjkGrI+KVfcJfDj45xmGl/4VyHE7c0jJdesecDITtMQ=;
        b=o3KHWKszdd1iAZneRvzPpeI2u5VXTQ1l3jTkHGTYDQzgBi3EAMILsXWMQ3mnATqaKN
         g7eji2Z58pjJVCm7B5zdbnQ/T2h1tOHPJf24rrMGTn176om2tyGNKLmllro9W/2ziQ85
         FlrcUGN/gBQxcEbCF/TF1cayKntGOUrcvurb7n7HveeNGQfdzhvRtfYvAwdKC8UdbLn5
         5J3tSlmauU9X7F758V+nH9NNqzYENcTEl35Q/WtxXxSFWGMrPMiWHASEKCHvudGKEjwK
         Hw6hISxl1jppgpDfiKYnMfws1pRpfW1sBfx2R7PWdtfsWo/WtV8sL3P8Pg9lbglFCOJj
         /bBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jjkGrI+KVfcJfDj45xmGl/4VyHE7c0jJdesecDITtMQ=;
        b=QLoVQxxJh8CCW3/aOWxoOSidk5h8hEjtaKzty1fLkBFeGaPUp/M7OfrRN2gDo7kgkF
         D4bU6ofbkegfwA3CnbDXRCarjeoM8j+KLDBPFltqgpb9ueYE/TmNjNSthnEqLaKpuWWf
         NeZW5uSezOH+rtQ20RVYGdbhJHNIHRckKmXaul9VlZQdysb/aAByoQijP2GS6RD/wUXk
         RlCxjkYwQlvBvLtaaI8PAMlWkK9YbKVyK2Fudl9OqvORSwH5WG2p9d1Fovk22Ej5MOPG
         BI09SnJF0UwgqAPsGBJg/n2DbOU4hDGMS+RRbjSMB4jNwNa7P5TdF5QJoP92mfsM1PFF
         FjCA==
X-Gm-Message-State: APjAAAXQ9shqYRDshGmd3TRAwNj25T2A0//Oh13KwST6kcpWwifFApI0
        DfUfaJ9Qo6KlpsWdfvtK9wM=
X-Google-Smtp-Source: APXvYqw37KVItciqP7tMFoIrM44uXFC+XSmPrp/svB2B5OpO/wQn8XHFOIcrG40/GA6Q2IPA9mu9og==
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr19050683wmq.142.1579532767691;
        Mon, 20 Jan 2020 07:06:07 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id d14sm51139253wru.9.2020.01.20.07.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 07:06:06 -0800 (PST)
Date:   Mon, 20 Jan 2020 16:06:05 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Message-ID: <20200120150605.GA712203@ulmo>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2020 at 05:23:43PM +0200, Georgi Djakov wrote:
> Hi Thierry,
>=20
> Thanks for the patch!
>=20
> On 1/14/20 20:15, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Document the interconnects property that is used to describe the paths
> > from and to system memory from and to the BPMP.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Rob, Georgi,
> >=20
> > after the initial RFC that I did for adding interconnect properties on
> > Tegra, I realized that the description wasn't complete. This is an
> > attempt at a more accurate description, but unfortunately I'm not sure
> > if it's even correct in terms of the interconnect bindings.
> >=20
> > The problem here is that on Tegra, each device has multiple paths to
> > system memory, and I have no good idea on what to pick as the default.
> > They are all basically the same path, but each provides extra controls
> > to configure the "interconnect".
>=20
> Are these multiple paths between a device and system memory used simultan=
eously
> for load-balancing, or who makes the decision about which path would be u=
sed?

It varies. The vast majority of these paths are read/write pairs, which
can be configured separately. There are also cases where multiple paths
are used for load-balancing and I don't think there's any direct
software control over which path will be used.

A third class is where you have one device, but two read/write pairs,
one which is tied to a microcontroller that's part of the device, and
another read/write pair that is used for DMA to/from the device.

Often in the latter case, the microcontroller memory client interfaces
will be used by the microcontroller to read firmware and once the micro-
controller has booted up, the DMA memory client interfaces will be used
to read/write system memory with bulk data (like frame buffers, etc.).

> Is this based on the client/stream ID that you mentioned previously?

These are now all what's call memory client IDs, which identify the
corresponding interface to the memory controller. Stream IDs are
slightly higher-level and typically identify the "module" that uses
the SMMU. Generally a stream ID is mapped to one or more memory client
IDs.

> Looking at the the binding below, it seems to me like there are different
> master/slave pairs between MC and EMC and each link is used for
> unidirectional traffic only. In terms of the interconnect API, both read
> and write paths have the same direction.

I'm not sure I understand what you mean by this last sentence. Are you
saying that each path in terms of the interconnect API is a always a
bidirectional link?

> Is the EMC really an interconnect provider or is it just a slave port? Can
> we scale both EMC and MC independently?

The EMC is the only one where we can scale the frequency, but the MC has
various knobs that can be used to fine-tune arbitration, set maximum
latency, etc.

I vaguely recall Dmitry mentioning that the EMC in early generations of
Tegra used to have controls for individual memory clients, but I don't
see that in more recent generations.

Thierry

> > Any ideas on how to resolve this? Let me know if the DT bindings and
> > example don't make things clear enough.
> >=20
> > Thierry
> >=20
> >  .../firmware/nvidia,tegra186-bpmp.yaml        | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186=
-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpm=
p.yaml
> > index dabf1c1aec2f..d40fcd836e90 100644
> > --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.y=
aml
> > +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.y=
aml
> > @@ -43,6 +43,24 @@ properties:
> >        - enum:
> >            - nvidia,tegra186-bpmp
> > =20
> > +  interconnects:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: A list of phandle and specifier pairs that describe t=
he
> > +      interconnect paths to and from the BPMP.
> > +
> > +  interconnect-names:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description: One string for each pair of phandle and specifier in =
the
> > +      "interconnects" property.
> > +    # XXX We need at least one of these to be named dma-mem so that th=
e core
> > +    # will set the DMA mask based on the DMA parent, but all of these =
go to
> > +    # system memory eventually.
> > +    items:
> > +      - const: dma-mem
> > +      - const: dma-mem
> > +      - const: dma-mem
> > +      - const: dma-mem
> > +
> >    iommus:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      description: |
> > @@ -152,8 +170,43 @@ additionalProperties: false
> > =20
> >  examples:
> >    - |
> > +    #include <dt-bindings/clock/tegra186-clock.h>
> >      #include <dt-bindings/interrupt-controller/arm-gic.h>
> >      #include <dt-bindings/mailbox/tegra186-hsp.h>
> > +    #include <dt-bindings/memory/tegra186-mc.h>
> > +
> > +    mc: memory-controller@2c00000 {
> > +        compatible =3D "nvidia,tegra186-mc";
> > +        reg =3D <0x02c00000 0xb0000>;
> > +        interrupts =3D <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> > +        status =3D "disabled";
> > +
> > +        #interconnect-cells =3D <1>;
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        ranges =3D <0x02c00000 0x0 0x02c00000 0x0 0xb0000>;
> > +
> > +        /*
> > +         * Memory clients have access to all 40 bits that the memory
> > +         * controller can address.
> > +         */
> > +        dma-ranges =3D <0x0 0x0 0x0 0x100 0x0>;
> > +
> > +        #memory-controller-cells =3D <0>;
> > +
> > +        emc: external-memory-controller@2c60000 {
> > +            compatible =3D "nvidia,tegra186-emc";
> > +            reg =3D <0x0 0x02c60000 0x0 0x50000>;
> > +            interrupts =3D <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
> > +            clocks =3D <&bpmp TEGRA186_CLK_EMC>;
> > +            clock-names =3D "emc";
> > +
> > +            #interconnect-cells =3D <0>;
> > +
> > +            nvidia,bpmp =3D <&bpmp>;
> > +        };
> > +    };
> > =20
> >      hsp_top0: hsp@3c00000 {
> >          compatible =3D "nvidia,tegra186-hsp";
> > @@ -187,6 +240,12 @@ examples:
> > =20
> >      bpmp {
> >          compatible =3D "nvidia,tegra186-bpmp";
> > +        interconnects =3D <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPR>,
> > +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc>,
> > +                        <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
> > +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc>;
> > +        interconnect-names =3D "dma-mem", "dma-mem", "dma-mem", "dma-m=
em";
> > +
> >          iommus =3D <&smmu TEGRA186_SID_BPMP>;
> >          mboxes =3D <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MAST=
ER_BPMP>;
> >          shmem =3D <&cpu_bpmp_tx &cpu_bpmp_rx>;
> >=20

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4lwdsACgkQ3SOs138+
s6Hdgg/+PAPsRJzrmRnjHtctC9WCw3qssBToHFiLFo2ggkiMJ/C7xDYSV6oP3Ntr
45st7Nu+TjphUW4BmDROUA+0YN4pUikmwmiCwm4Xr0xx2Og4pYc1SjChC3+/Cj2+
IO3bPBlLzorH36dL2vNiEF8ZemsdCHSBQKdJQ8tohuTYEEf/OcXvPbXo8F9/WMJj
REfgg4sJaGFt+1O7ESJhAvSQuLQ+8mva5Nm7CVqbi2tYb5w1Tzo6seM7mBtmUWdL
jDr5yYC4pqJcJF0gZ0Y7Bz6IIhwepKfer2LQDW87/8cy7/kAUEezI7Es9SEq0t6G
SjMAU39bSNe9jHpCg9hKu1NIQC4W6ItZlZG42nkxgLpLPlIddzArRdb+IhSV4xFb
bpvOLEa+4dktjtUHZ2S2dJMSNKb3X13MAQ031eYRHC8eZJeA4+fCVGlGrTUygt4W
3CMOrx6Kk2z+Qj4OXZWbvK1Xo1XetN50BEfewrQG8HI4Pd2IDskRHXdpCkCMMVee
B8vzmRQf5lNoaeQsy6T+zr3SMd+HXBYxNgDOpO3D9NFlpV4jPu0I4PJIQMLpde87
cl1PS0uh5Bq+Owpda22WIqSUczCLIFNjegUxzbgZQULa76vOXiOTr3iAOVNUwk1X
18Caf9PG1LWpiWGoxdFFOQt/fRRgIHnhHY6flotcZcjqbtrcouM=
=GEA6
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
