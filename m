From: Markus Mayer <markus.mayer@broadcom.com>
Subject: Re: [PATCH v1 0/3] Add support for Broadcom OTP controller
Date: Mon, 24 Oct 2016 15:45:04 -0700
Message-ID: <CAGt4E5vyEXgxbuCgzjmE0LxwNM-A7BQ4_wMBv3G350TY=zyLtA@mail.gmail.com>
References: <1477336324-10543-1-git-send-email-jonathan.richardson@broadcom.com>
 <CAADWXX-43-k2K2T1V5MQMd0z0V502wf1syNHERPfvNstOJw-3A@mail.gmail.com>
 <e34f01b6-a059-9988-0f93-e5adb82a5436@gmail.com> <CA+55aFwAZPJ+o0qkYjJziHofYvvsocHuWr1YUmVnzj6VTv_sgA@mail.gmail.com>
 <82ad10b1-32ab-3962-d5ab-e787e2c70130@gmail.com> <CA+55aFxeu9YKb=zAba8MVRgxmJoQJ8W6u3NNJv7rP6mwxj+nVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFxeu9YKb=zAba8MVRgxmJoQJ8W6u3NNJv7rP6mwxj+nVA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Jonathan Richardson <jonathan.richardson@broadcom.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

FWIW, this thread ends up in the spam folder for me also on my private
e-mail account. And it's not the only Broadcom thread. Quite a few
Broadcom e-mails end up there. The thread was sent to me via
infradead.org. My private e-mail is also hosted by Gmail.

I get this:

SPF: PASS with IP 2001:1868:205:0:0:0:0:9 Learn more
DKIM: NEUTRAL with domain null Learn more
DMARC: FAIL Learn more

So, it's not DKIM for me, but DMARC that's failing.

The actual headers:

Received: from bombadil.infradead.org (bombadil.infradead.org.
[2001:1868:205::9])
        by mx.google.com with ESMTPS id
r127si16944054pgr.251.2016.10.24.12.13.37
        for <mmayer at mmayer.net>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Oct 2016 12:13:37 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of
linux-arm-kernel-bounces+mmayer=mmayer.net@lists.infradead.org
designates 2001:1868:205::9 as permitted sender)
client-ip=2001:1868:205::9;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@broadcom.com;
       spf=pass (google.com: best guess record for domain of
linux-arm-kernel-bounces+mmayer=mmayer.net@lists.infradead.org
designates 2001:1868:205::9 as permitted sender)
smtp.mailfrom=linux-arm-kernel-bounces+mmayer=mmayer.net@lists.infradead.org;
       dmarc=fail (p=QUARANTINE dis=NONE) header.from=broadcom.com
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org) by
bombadil.infradead.org

Regards,
-Markus
