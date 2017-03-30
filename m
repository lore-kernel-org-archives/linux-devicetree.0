From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] mtd: spi-nor: add stm32 qspi driver
Date: Thu, 30 Mar 2017 12:15:57 +0200
Message-ID: <e04fa293-63d4-7a7e-a998-37aab31167e5@gmail.com>
References: <1490619296-8168-1-git-send-email-ludovic.Barre@st.com>
 <5224f3cd-a128-9e72-c0c8-62a137ceeb79@wedev4u.fr>
 <d1c2f0a9-302d-ea7c-5d1b-ad32b9950ed4@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d1c2f0a9-302d-ea7c-5d1b-ad32b9950ed4-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/30/2017 09:31 AM, Ludovic BARRE wrote:
> hi Cyrille
> 
> I see your patch series
> 
> [PATCH v5 0/6] mtd: spi-nor: parse SFDP tables to setup (Q)SPI memories
> 
> No problem, I rebase my V2 onto your patch

I still didn't review that, so it might take a bit until it hits
mainline. I think the stm32 stuff looks pretty OK, so we can take that
before the SFDP stuff, no?

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
