From: Maksym Kokhan <maksym.kokhan@globallogic.com>
Subject: Re: [PATCH 2/8] drivers: of: ifdef out cmdline section
Date: Mon, 8 Oct 2018 20:58:59 +0300
Message-ID: <CAMT6-xiBrtRZYRpRFzqbSOG6=h1=OJpROeKArLBbZ-4H8kJgxA@mail.gmail.com>
References: <1538067327-5785-1-git-send-email-maksym.kokhan@globallogic.com> <CAL_JsqLtwy_odfY+7-Braa1vJFPxF-+P+UcEFNSJaQGFhd9qig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLtwy_odfY+7-Braa1vJFPxF-+P+UcEFNSJaQGFhd9qig@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Daniel Walker <dwalker@fifo99.com>, Daniel Walker <danielwa@cisco.com>, Andrii Bordunov <aborduno@cisco.com>, Ruslan Bilovol <rbilovol@cisco.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi, Rob

On Fri, Sep 28, 2018 at 12:07 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, Sep 27, 2018 at 11:55 AM Maksym Kokhan
> <maksym.kokhan@globallogic.com> wrote:
> >
> > From: Daniel Walker <danielwa@cisco.com>
> >
> > It looks like there's some seepage of cmdline stuff into
> > the generic device tree code. This conflicts with the
> > generic cmdline implementation so I remove it in the case
> > when that's enabled.
>
> What's preventing removing this or simplifying the DT code to just be
> "give me the cmdline data from DT" and the common code deals with all
> the combinations of config options.

This code (handling built-in cmdline in old, non-generic way) is used by
some other architectures besides those, modified in our patches, so for
now we can't remove it.

Thanks,
Maksym
