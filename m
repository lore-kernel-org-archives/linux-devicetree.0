From: Sven Eckelmann <sven-KaDOiPu9UxWEi8DpZVb4nw@public.gmane.org>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
Date: Wed, 21 Aug 2019 08:16:27 +0200
Message-ID: <1635460.phzPRRphLd@bentobox>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org> <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2661494.foTVnLV1sx"; micalg="pgp-sha512"; protocol="application/pgp-signature"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1566316095-27507-32-git-send-email-kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--nextPart2661494.foTVnLV1sx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 20 August 2019 17:47:57 CEST Kalle Valo wrote:
> +static void ath11k_peer_assoc_h_rates(struct ath11k *ar,
> +                                     struct ieee80211_vif *vif,
> +                                     struct ieee80211_sta *sta,
> +                                     struct peer_assoc_params *arg)
> +{
> +       struct ath11k_vif *arvif = (void *)vif->drv_priv;
> +       struct wmi_rate_set_arg *rateset = &arg->peer_legacy_rates;
> +       struct cfg80211_chan_def def;
> +       const struct ieee80211_supported_band *sband;
> +       const struct ieee80211_rate *rates;
> +       enum nl80211_band band;
> +       u32 ratemask;
> +       u8 rate;

rate has to be u32 [1].

Kind regards,
	Sven

[1] https://patchwork.kernel.org/patch/11089507/
--nextPart2661494.foTVnLV1sx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl1c4bsACgkQXYcKB8Em
e0aLmBAAhoE9lMj0hnfUTO5uRdRLBjgzTR+CAV2Bc72Q4TRzRnt/7NoWfTrViIXW
Q0MepQ/3Hs6bZc0s+IOqIEduGCGRNrJcbc6q6HlkmcYQmqfkC7cbfnZyzhDZFOLM
0HbG2wTomoKEJqshc0aDMjaV3N4i6Tj5em590kUktfYTLHoZFJs4G7AdAnIC9nB7
Kij4lbg6zmOemuenkT0LV/6D3RVjJr0MkcGNd3jsRFgdtCZCJf/5EtVu5goMASSz
yGwcnTBrp9kaXRp2XRw4j5FO8oogMxXl77neGvnrUHG9mUF23ke+5Dr6X9wOrnpe
m6zd2RI/2L1E8tKUMUnm7BaJhmqOtJaE6Jd8jcFjptHo8EUe6tr1ZkC7E46xFCER
fhOqsULieRZDBDLpuhTWCTYip7OO8E842GDTvyD3SWUCbaFVOzF9ttolvvqLKMfB
V5ntQ5KfyWB9q+3NMNMvqCQqVZnUnTVK2QvDt3JHC6uhqoZiyFGTy3RVFdBVr06x
g24bg/lEXSTV4nMFUzMlJ+9upRZ3q0H1l6x4bPfWdZNdow/jzuhejvyXv/NTQujR
iGCb9BPWictQ8QAfZI/FJdrJehlsUe68pQIstiKXVSGKGUzuhYnOhmr4q+yfuYsj
vC7uBwgqDsGEH2mzGYATTcU04cE2W7XOCckFk9pGO2UOaQIcMrY=
=8elU
-----END PGP SIGNATURE-----

--nextPart2661494.foTVnLV1sx--
