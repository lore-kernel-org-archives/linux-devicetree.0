From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH v1 0/3] Add support for Broadcom OTP controller
Date: Mon, 24 Oct 2016 13:14:53 -0700
Message-ID: <CA+55aFwAZPJ+o0qkYjJziHofYvvsocHuWr1YUmVnzj6VTv_sgA@mail.gmail.com>
References: <1477336324-10543-1-git-send-email-jonathan.richardson@broadcom.com>
 <CAADWXX-43-k2K2T1V5MQMd0z0V502wf1syNHERPfvNstOJw-3A@mail.gmail.com> <e34f01b6-a059-9988-0f93-e5adb82a5436@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e34f01b6-a059-9988-0f93-e5adb82a5436-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 24, 2016 at 12:54 PM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> The older setup was using smtphost.broadcom.com which we have now
> documented as being invalid, here Jonathan used gmail directly (since
> that's our mail provider now):
>
> Received: from lbrmn-lnxub108.corp.ad.broadcom.com ([216.31.219.19])
>         by smtp.gmail.com with ESMTPSA id
> s89sm8325746qkl.44.2016.10.24.12.12.00
>         (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
>         Mon, 24 Oct 2016 12:12:03 -0700 (PDT)

Hmm. I get that too, so if that's the right thing for a broadcom.com
address, it's not the smtp server issue.

We had a few cases of the kernel mailing list itself messing up emails
sufficiently to fail dkim, but that shouldn't be an issue for the
relaxed/relaxed model that broadcom uses (the vger mailing list
software screws up whitespace, which "relaxed" ignores).

> Is there something else we need to check? Here is what I read for the
> cover-letter:
>
> Authentication-Results: mx.google.com;
>        dkim=pass header.i=@broadcom.com;
>        spf=pass (google.com: domain of ...

Hmm. I get:

  Authentication-Results: mx.google.com;
         dkim=fail header.i=@broadcom.com;

with the actual dkim signature looking like this:

  DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=9zStGnsZQDQqP6cm1CHPk7EYVtLvDsm2wN5qy5Mgx7M=;
        b=Z/1QD+FwJogJY9D8Qd197Q+VJt7Tr9+WoHFeKYRL00yhvxrMg0P8jKj1FbucJTluvM
         agC2eq9qCpZcNAfridjExDRDCuUPAIJIXTr9Npkpqlk6gEMq2FysrGer2D9Z4HQ/atTX
         67VirFsQK0gK7impYMn9kW5Q9BIIw5bOg7OdI=

and those fields that it protects look like this:

  From: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
  To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime
Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
  Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland
<mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott
Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>,
bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Jonathan Richardson
<jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
  Subject: [PATCH v1 0/3] Add support for Broadcom OTP controller
  Date: Mon, 24 Oct 2016 12:12:01 -0700
  Message-Id: <1477336324-10543-1-git-send-email-jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

and I don't see anything obviously wrong anywhere - except for that
"dkim=fail" thing, and the email being in my spam folder.

               Linus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
