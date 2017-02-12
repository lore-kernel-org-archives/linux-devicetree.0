From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] DT: add Faraday Tec. as vendor
Date: Sun, 12 Feb 2017 21:37:37 +0100
Message-ID: <CACRpkdbqFwRMLd__L3gv-hSv0wNZAQk5gxEJPK=wBQuXjJTK5w@mail.gmail.com>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com> <20170208200010.21522-4-ulli.kroll@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208200010.21522-4-ulli.kroll@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Rob Herring <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 8, 2017 at 9:00 PM, Hans Ulli Kroll
<ulli.kroll@googlemail.com> wrote:

> add Faraday Technology Corporation as vendor faraday for DT
>
> Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>

I realized a lot of Gemini IP blocks are actually from Faraday, so now
I'm editing the drivers a bit...

Rob could you pick this patch directly to the DT tree so we need
not worry about the vendor thing?

Yours,
Linus Walleij
