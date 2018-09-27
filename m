From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/8] drivers: of: ifdef out cmdline section
Date: Thu, 27 Sep 2018 16:07:12 -0500
Message-ID: <CAL_JsqLtwy_odfY+7-Braa1vJFPxF-+P+UcEFNSJaQGFhd9qig@mail.gmail.com>
References: <1538067327-5785-1-git-send-email-maksym.kokhan@globallogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538067327-5785-1-git-send-email-maksym.kokhan@globallogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maksym.kokhan@globallogic.com
Cc: Frank Rowand <frowand.list@gmail.com>, Daniel Walker <dwalker@fifo99.com>, Daniel Walker <danielwa@cisco.com>, aborduno@cisco.com, rbilovol@cisco.com, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 11:55 AM Maksym Kokhan
<maksym.kokhan@globallogic.com> wrote:
>
> From: Daniel Walker <danielwa@cisco.com>
>
> It looks like there's some seepage of cmdline stuff into
> the generic device tree code. This conflicts with the
> generic cmdline implementation so I remove it in the case
> when that's enabled.

What's preventing removing this or simplifying the DT code to just be
"give me the cmdline data from DT" and the common code deals with all
the combinations of config options.

Rob
