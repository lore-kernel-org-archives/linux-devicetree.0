Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64346C2D0CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 14:10:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FB62217F4
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 14:10:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uzT1khDs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgAUOKe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 09:10:34 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:37769 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgAUOKe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jan 2020 09:10:34 -0500
Received: by mail-wr1-f51.google.com with SMTP id w15so3376441wru.4;
        Tue, 21 Jan 2020 06:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XRpphs2S9wZTGTytK13LtytO9wnJoc1ItNQDAtJ9sJY=;
        b=uzT1khDsSuk3Vgl0MBaHZfT/MNypKjXd9XugPdUZL/m5sWVrgxd7xZoKpo0ZCC7/i7
         +ZYVvih2CAao09ynWt37QJWQ2wnQrwoMYfDE5UPKiEGh1xn0ThIZmoiycEzTm5sDvecu
         kyrAjIAxUoqKhQzfJTaCdqsrBdawgoDhhxv7wrzH0qcArfPalClpB20a0s+HWNz629AR
         +2iaF+CFGqYocWLzI/LupCpsDOQnf2Tl/GqoBMX+24boVejMD7IiB+UfspSsOQIteIqr
         z0ud/IzRzBqfwkiIXzRfTyzvZ8vxBoT2+xrb22xI4M8DZVSeO9YIUk6orFTayh2TiWJY
         os3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XRpphs2S9wZTGTytK13LtytO9wnJoc1ItNQDAtJ9sJY=;
        b=X0Nml2zVyJiPObkue5rGTkLFmzAwYO0iEegYVTDE1Fk43OM3CIv3m3ksGrc16Gm19n
         vxO/pewEzJwLrCaHPEU+p/B2pQ/YYL2e/Yvx8kuXj6BJX/6TXwG+YZaLhi8P5zETtUZ+
         /0dq/eNEjPNx3jK2C79/6UQ9yJaJ34iU54iIzP45gKWVbjz5nRV+e0doX4mDYE0SqdRG
         CFnMFdobB4O4xOQR0hryY/KI50TUKQvwCILZVqUb57mYprANjjah3v+9JYRUnIjgnAlZ
         Lz30TnCF9Qy8pyJQhvoWVc+0COovgYVSFIIBuTYqx8WzDpJTtyUmsPZq0sQ7qLfX5OJP
         k6DQ==
X-Gm-Message-State: APjAAAVh29M+z6eoOGk7lsDQt0BYSXZzwRpikZ+shTwt5mtwtyb9cqJx
        b5zTYXkgRvTd4ncSi53JEAU=
X-Google-Smtp-Source: APXvYqxW80LwqMX7ZQFDkbH92p2ADBj+z4A5Iv4J1Z3o+tOe3H2AekLZ3cnTAmOZtv9qlqDHj1dDCw==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr5650970wru.296.1579615830901;
        Tue, 21 Jan 2020 06:10:30 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id d16sm56769006wrg.27.2020.01.21.06.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 06:10:29 -0800 (PST)
Date:   Tue, 21 Jan 2020 15:10:27 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Message-ID: <20200121141027.GE899558@ulmo>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gDGSpKKIBgtShtf+"
Content-Disposition: inline
In-Reply-To: <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--gDGSpKKIBgtShtf+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 09:53:48AM +0300, Dmitry Osipenko wrote:
> 20.01.2020 18:06, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Jan 17, 2020 at 05:23:43PM +0200, Georgi Djakov wrote:
> >> Hi Thierry,
> >>
> >> Thanks for the patch!
> >>
> >> On 1/14/20 20:15, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> Document the interconnects property that is used to describe the paths
> >>> from and to system memory from and to the BPMP.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>> Rob, Georgi,
> >>>
> >>> after the initial RFC that I did for adding interconnect properties on
> >>> Tegra, I realized that the description wasn't complete. This is an
> >>> attempt at a more accurate description, but unfortunately I'm not sure
> >>> if it's even correct in terms of the interconnect bindings.
> >>>
> >>> The problem here is that on Tegra, each device has multiple paths to
> >>> system memory, and I have no good idea on what to pick as the default.
> >>> They are all basically the same path, but each provides extra controls
> >>> to configure the "interconnect".
> >>
> >> Are these multiple paths between a device and system memory used simul=
taneously
> >> for load-balancing, or who makes the decision about which path would b=
e used?
> >=20
> > It varies. The vast majority of these paths are read/write pairs, which
> > can be configured separately. There are also cases where multiple paths
> > are used for load-balancing and I don't think there's any direct
> > software control over which path will be used.
> >=20
> > A third class is where you have one device, but two read/write pairs,
> > one which is tied to a microcontroller that's part of the device, and
> > another read/write pair that is used for DMA to/from the device.
> >=20
> > Often in the latter case, the microcontroller memory client interfaces
> > will be used by the microcontroller to read firmware and once the micro-
> > controller has booted up, the DMA memory client interfaces will be used
> > to read/write system memory with bulk data (like frame buffers, etc.).
> >=20
> >> Is this based on the client/stream ID that you mentioned previously?
> >=20
> > These are now all what's call memory client IDs, which identify the
> > corresponding interface to the memory controller. Stream IDs are
> > slightly higher-level and typically identify the "module" that uses
> > the SMMU. Generally a stream ID is mapped to one or more memory client
> > IDs.
> >=20
> >> Looking at the the binding below, it seems to me like there are differ=
ent
> >> master/slave pairs between MC and EMC and each link is used for
> >> unidirectional traffic only. In terms of the interconnect API, both re=
ad
> >> and write paths have the same direction.
>=20
> Yes, that definition should be incorrect.
>=20
> > I'm not sure I understand what you mean by this last sentence. Are you
> > saying that each path in terms of the interconnect API is a always a
> > bidirectional link?
>=20
> Please see more below.
>=20
> >> Is the EMC really an interconnect provider or is it just a slave port?=
 Can
> >> we scale both EMC and MC independently?
> >=20
> > The EMC is the only one where we can scale the frequency, but the MC has
> > various knobs that can be used to fine-tune arbitration, set maximum
> > latency, etc.
>=20
> Yes..
>=20
>=20
> EMC controls the total amount of available memory bandwidth, things like
> DRAM timing and EMC-DRAM channel's performance. EMC is facing MC from
> one side and DRAM (EMEM) from the other.
>=20
>=20
>=20
> MC controls allocation of that total bandwidth between the memory
> clients. It has knobs to prioritize clients, the knobs are per
> read/write port. MC is facing memory clients from one side and EMC from
> the other.
>=20
>=20
> > I vaguely recall Dmitry mentioning that the EMC in early generations of
> > Tegra used to have controls for individual memory clients, but I don't
> > see that in more recent generations.
>=20
> EMC doesn't have direct controls over memory clients on all Tegra SoCs,
> but it may have some extra knobs for the MC arbitration config.
>=20
> The MC bandwidth allocation logic and hardware programming interface
> differs among SoC generations, but the basic principle is the same.
>=20
> >>> Any ideas on how to resolve this? Let me know if the DT bindings and
> >>> example don't make things clear enough.
>=20
> I'm also interested in the answer to this question.
>=20
> A quick thought.. maybe it could be some new ICC DT property which tells
> that all paths are the "dma-mem":
>=20
> 	interconnects-all-dma-mem;

There could easily be cases where multiple interconnects are to system
memory but there are additional ones which aren't, so the above wouldn't
be able to represent such cases.

> >>>  .../firmware/nvidia,tegra186-bpmp.yaml        | 59 +++++++++++++++++=
++
> >>>  1 file changed, 59 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra1=
86-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-b=
pmp.yaml
> >>> index dabf1c1aec2f..d40fcd836e90 100644
> >>> --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp=
=2Eyaml
> >>> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp=
=2Eyaml
> >>> @@ -43,6 +43,24 @@ properties:
> >>>        - enum:
> >>>            - nvidia,tegra186-bpmp
> >>> =20
> >>> +  interconnects:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >>> +    description: A list of phandle and specifier pairs that describe=
 the
> >>> +      interconnect paths to and from the BPMP.
> >>> +
> >>> +  interconnect-names:
> >>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> >>> +    description: One string for each pair of phandle and specifier i=
n the
> >>> +      "interconnects" property.
> >>> +    # XXX We need at least one of these to be named dma-mem so that =
the core
> >>> +    # will set the DMA mask based on the DMA parent, but all of thes=
e go to
> >>> +    # system memory eventually.
> >>> +    items:
> >>> +      - const: dma-mem
> >>> +      - const: dma-mem
> >>> +      - const: dma-mem
> >>> +      - const: dma-mem
>=20
> Names should be unique, otherwise it's not possible to retrieve ICC path
> other than the first one.

Yeah, I know, that's why there's an XXX comment. =3D) I just wasn't sure
what else to put there and thought this kinda made it clear that it was
only half-baked.

> >>>    iommus:
> >>>      $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>      description: |
> >>> @@ -152,8 +170,43 @@ additionalProperties: false
> >>> =20
> >>>  examples:
> >>>    - |
> >>> +    #include <dt-bindings/clock/tegra186-clock.h>
> >>>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>      #include <dt-bindings/mailbox/tegra186-hsp.h>
> >>> +    #include <dt-bindings/memory/tegra186-mc.h>
> >>> +
> >>> +    mc: memory-controller@2c00000 {
> >>> +        compatible =3D "nvidia,tegra186-mc";
> >>> +        reg =3D <0x02c00000 0xb0000>;
> >>> +        interrupts =3D <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> >>> +        status =3D "disabled";
> >>> +
> >>> +        #interconnect-cells =3D <1>;
> >>> +        #address-cells =3D <2>;
> >>> +        #size-cells =3D <2>;
> >>> +
> >>> +        ranges =3D <0x02c00000 0x0 0x02c00000 0x0 0xb0000>;
> >>> +
> >>> +        /*
> >>> +         * Memory clients have access to all 40 bits that the memory
> >>> +         * controller can address.
> >>> +         */
> >>> +        dma-ranges =3D <0x0 0x0 0x0 0x100 0x0>;
> >>> +
> >>> +        #memory-controller-cells =3D <0>;
> >>> +
> >>> +        emc: external-memory-controller@2c60000 {
> >>> +            compatible =3D "nvidia,tegra186-emc";
> >>> +            reg =3D <0x0 0x02c60000 0x0 0x50000>;
> >>> +            interrupts =3D <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
> >>> +            clocks =3D <&bpmp TEGRA186_CLK_EMC>;
> >>> +            clock-names =3D "emc";
> >>> +
> >>> +            #interconnect-cells =3D <0>;
> >>> +
> >>> +            nvidia,bpmp =3D <&bpmp>;
> >>> +        };
> >>> +    };
> >>> =20
> >>>      hsp_top0: hsp@3c00000 {
> >>>          compatible =3D "nvidia,tegra186-hsp";
> >>> @@ -187,6 +240,12 @@ examples:
> >>> =20
> >>>      bpmp {
> >>>          compatible =3D "nvidia,tegra186-bpmp";
> >>> +        interconnects =3D <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPR>,
> >>> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc>,
> >>> +                        <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
> >>> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc>;
>=20
> I don't think this is a correct definition of the ICC paths because the
> first node-MC_ID pair should define the source, second pair is the final
> destination. Then the interconnect core builds (by itself) the path from
> MC client to MC and finally to EMC based on the given source /
> destination. Please see my v1 patchset for the example.

Okay, sounds like "source" in this case means the initiator of the
transaction and destination is the target of the transaction. I had
interpreted the "source" as the "source location" of the transaction (so
for reads the source would be the system memory via the EMC, and for
writes the source would be the memory client interface).

Yeah, I think that makes sense. It was also pointed out to me (offline)
that the above doesn't work as intented for the use-case where I really
need it. The primary reason why I need these "dma-mem" interconnect
paths is so that the memory controller is specified as the "DMA parent"
for these devices, which is important so that the DMA masks can be
correctly set. Having the &emc reference in the first slot breaks that.
Your suggestion makes sense when interpreting the terminology
differently and it fixes the DMA parent issue (at least partially).

> It should look somewhat like this:
>=20
> interconnects =3D
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPR &emc TEGRA_ICC_EMEM>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc TEGRA_ICC_EMEM>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &emc TEGRA_ICC_EMEM>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc TEGRA_ICC_EMEM>;
>=20
> interconnect-names =3D "bpmpr", "bpmpw", "bpmpdmar", "bpmpdmaw";

I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's always
going to be the same and it's arbitrarily defined, so it's effectively
useless. But other than that it looks good.

I suppose one could argue about the names a bit. Having the "bpmp"
prefix for all of them feels a little redundant. They could also be
[ "read", "write", "dma-read", "dma-write" ], which would make them
a little more contextual, like we do with other clocks.

However, like I said before, at least one of these would need to be
named "dma-mem" in order for the memory controller to be selected as
the DMA parent. But, perhaps we just need to look at this some other
way and specify an additional way of specifying the DMA parent for
devices that doesn't rely on a "dma-mem" interconnect-names property.

Perhaps some new dma-parent property that takes a phandle (with perhaps
an optional specifier) would work? I think that may tie in nicely with
the memory controller mini-framework that I had proposed a while ago.

Rob, any thoughts on that?

Thierry

> >>> +        interconnect-names =3D "dma-mem", "dma-mem", "dma-mem", "dma=
-mem";
> >>> +
> >>>          iommus =3D <&smmu TEGRA186_SID_BPMP>;
> >>>          mboxes =3D <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MA=
STER_BPMP>;
> >>>          shmem =3D <&cpu_bpmp_tx &cpu_bpmp_rx>;
> >>>
>=20

--gDGSpKKIBgtShtf+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4nBlEACgkQ3SOs138+
s6EXeA//eeSqKALLtIqM2VZRxdqYkhL0dvy2ONjL2j8WtbXRKpc4OiEPNmaOesxU
+31NGNnstcMlOxpZ3PGLq9ENk77wJj+SMl/HOL4a/herC1X5uKuS0b0zJ6ezY/7B
6IK+WpoVheRwa5eiV1Un2bAb/IQtlYMz5FC+tqs1XN0ot6TlHwESxv3iS+L8XEXy
lmD8M+PY0Eb3W6UDsR0U5Nkxc4ZihPbwQ/IObuPZ2m7miX5NHzEL4PgArb9dzkGB
WtTpVvLHSVJagFprkXXH//cmWNjd0QebhBIc1niJ0XJyL6XAO6LcNoeQKbeqIKZJ
c0tVX/mk+FGUc6RvvW5/6BS6p4KaD9+7JpsWawIYn3p1JASQMMoBymMXzdWjCcd8
W35vKWfPks7EENWooi7lGHNnwRDTFZtQSpSi+wEkRxy6u2bD36ylcLTpIAg+dtgx
6cw5oyYYALbBxMTGaGZfzikbqMvaMKzJIYSyP7qwKDD3tX9AuvEw2YON0N3nGkkJ
0jtg+Ct1coDuw+Wi8O6+R7GwEGRiBRovoTeP+SbtyMOR+eDyFhz9QTuQ4vUUtF0h
EdSwwfqhXoJJQl/lWCFsm0lDfiMSQxuNJTqSiJcfQW5QobSSL6igtSkEXtW3HpIz
PdAcEHs4Ca+36mydC0rOiiaZLD1BSXN1AKRgjZu6t/j1rN6AkoQ=
=MTNd
-----END PGP SIGNATURE-----

--gDGSpKKIBgtShtf+--
