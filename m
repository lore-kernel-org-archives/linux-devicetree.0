From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Date: Tue, 17 Jan 2017 10:57:03 +0100
Message-ID: <20170117095702.GA1930@katana>
References: <SG2PR06MB1165D0D67AD68A12030C961D8A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUVnUS-iOM8cbXNP7jMLNFb5+hgnMp3edkCzpbEpAePzw@mail.gmail.com>
 <SG2PR06MB11659339E4A08373D3626BB28A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdX=cNuBSMqvPKYa7J5g7T4dSfHhSjcGdmuOPw_as=6RQQ@mail.gmail.com>
 <20170116114023.GA3029@katana>
 <SG2PR06MB11656A823E53F55C4FBCA7E88A7C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170117082118.GA1487@katana>
 <CAMuHMdVW=HORcCA0brX4tZdtG9knqE7D_wnM5VtSrxz2LdBgUA@mail.gmail.com>
 <20170117094529.GC1487@katana>
 <CAMuHMdViHu7i_Lqk80toWrW=KsR49hodGnTd-Cpq35ts9gNgyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdViHu7i_Lqk80toWrW=KsR49hodGnTd-Cpq35ts9gNgyw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If we handle them as one, won't we miss card detect events due to the
> card detect clock being disabled while SDHI is idle?

You mean this?

1208         /*
1209          * While using internal tmio hardware logic for card detection, we need
1210          * to ensure it stays powered for it to work.
1211          */
1212         if (_host->native_hotplug)
1213                 pm_runtime_get_noresume(&pdev->dev);



--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYfepuAAoJEBQN5MwUoCm2vQEP/0H5lboQDk879MdKIevDiY72
88upPFAh2taMVU6lac4kVsQ7sgL3qEigKuEv4vWPWszQFV3E/Cc+Q5wQfiMNqTSi
cu83CYptE61t4E5GyNEMoBgdJ1+0nSuXAiF1e/0b5safpK5+TwYLKjtsxb2widR9
suMb1X1jsmgIaBW2N96WZUB891yn0y+lUqRMNzq0wAdGGXNOT9CPj6InjmuVgs/E
cV4qO/GWAruOSQGxv/j3KIjY15xMBgjEmPqNyyrke+LfZ572+d5OB/MHDJWs0A2+
SoK4TgLOec6nUtJDJSOmywueoKy+9obwjIergzUPr/GS9jelW6FfSLlLOpEMB9d2
ORGSSXeIM9vDrmYU4uZ8dxc0gSKdjLYuKHXsvVvDO4cXLmaFoml847wVXZK5d5qG
zFMCZ9j7v5ZBkkY9HqELf/DNNd9szBycKmwvgydAvxqoOwEzykvrt/xCC1ZcVWnr
7zMP2Ria7pN8eo2ZdxOpOZ3kKJXJdqOndI12whyGdQKNnE0GWR80Ry+nwMBpy3Pu
mcS579Z8OLfQ4SgQuHKOTA2S0NMCn9ToJqkW5ahBA+SbxGbym1NIbUrg/f7lshPW
iXXiHIETy6nrz6c9gtLnE0y6u8QAPD8KM3UTN1Gt2oRvSJRl6eD9RvyMMq4DfzWC
1sRjMjXW6FKQ8z6XNa2s
=GXwl
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
