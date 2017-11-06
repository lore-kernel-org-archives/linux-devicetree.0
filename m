From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] brcmfmac: add support for external 32khz clock
Date: Mon, 06 Nov 2017 12:43:46 +0200
Message-ID: <87fu9rk7q5.fsf@codeaurora.org>
References: <20171106102934.GA23805@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171106102934.GA23805-WP75azK+jQYgsBAKwltoeQ@public.gmane.org> (Simon Shields's message
        of "Mon, 6 Nov 2017 21:29:40 +1100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brcm80211-dev-list.pdl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, brcm80211-dev-list-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org> writes:

> Some boards use an external 32khz clock for low-power
> mode timing. Make sure the clock is powered on while the chipset
> is active.
>
> Signed-off-by: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>

Then you submit a new version please always increase the version so that
I know which patch I should follow and take from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#patch_version_missing

And yes yes, I know the patch content was identical in this case but
even a change in Cc field is important from my point of view. No need to
resend, this reply is also a reminder to me that this is the v2 :)

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
