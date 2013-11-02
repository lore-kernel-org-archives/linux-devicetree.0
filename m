From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: [RFC 4/9] of/irq: Refactor interrupt-map parsing
Date: Sat, 2 Nov 2013 12:16:56 +0800
Message-ID: <CACVXFVN-Vk9k=jceT1iR2nfSNvHQR5MAtrb+vjw9QwcWnn9CVw@mail.gmail.com>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
	<1381869563-16083-5-git-send-email-grant.likely@linaro.org>
	<CAOesGMj03kgJXttm80pHvPYeqg5hOaeOJAJ4DA8tf5LxqdArrQ@mail.gmail.com>
	<CACxGe6uE+KvycQq3XBavRcvprff6PhBaxX54W_Cb1cfuVpMXvQ@mail.gmail.com>
	<20131031185714.GA12646@quad.lixom.net>
	<20131101175317.A812AC40868@trevor.secretlab.ca>
	<20131101185401.B298FC40868@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131101185401.B298FC40868@trevor.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 2, 2013 at 2:54 AM, Grant Likely <grant.likely@linaro.org> wrote:
>
> That one was broken. Try this instead.
>
> From bcbffc3d16f49451ef505dc021480aa061465a15 Mon Sep 17 00:00:00 2001
> From: Grant Likely <grant.likely@linaro.org>
> Date: Fri, 1 Nov 2013 10:50:50 -0700
> Subject: [PATCH] of: Fixup interrupt parsing failure.
>
> Signed-off-by: Grant Likely <grant.likely@linaro.org>
> ---
>  drivers/of/irq.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

This one does fix boot hanging on Arndale board.

Tested-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
-- 
Ming Lei
