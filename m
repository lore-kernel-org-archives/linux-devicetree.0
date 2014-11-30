From: Peter =?utf-8?q?H=C3=BCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v4 00/15] ST33 I2C TPM driver cleanup
Date: Sun, 30 Nov 2014 18:47:04 +0100
Message-ID: <201411301847.04422.PeterHuewe@gmx.de>
References: <1413753085-9958-1-git-send-email-christophe-h.ricard@st.com> <201411301437.18703.PeterHuewe@gmx.de> <20141130174120.618e9fe1@toffy-MacBookPro>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141130174120.618e9fe1@toffy-MacBookPro>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

> Thank you for your feedback (on Sunday :)).
> 
> To be honest i missed those warnings. I figured they come when CONFIG_OF
> is not set :/.
> 
> No problem to send a v5 with tpm/tpm_i2c_stm_st33: Fix potential bug in
> tpm_stm_i2c_send and replace r by ret. The purpose here was more to
> have a kind of convention inside the driver rather than mixing
> r/ret/err.
> 
> I hope to send this by tonight.

Would be great! - usually I try to sort this stuff out myself, but this is not 
possible at the moment.


Thanks,
Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
