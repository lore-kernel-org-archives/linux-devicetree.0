From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] of/device: Add a way to probe drivers by match data
Date: Tue, 6 Nov 2018 14:44:52 -0600
Message-ID: <CAL_JsqLvKWcJUYDyWOg3rMeEWv7JV4zw7-YkOUWiL5rfXgVRvQ@mail.gmail.com>
References: <20181106183609.207702-1-sboyd@kernel.org> <20181106183609.207702-2-sboyd@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181106183609.207702-2-sboyd@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 6, 2018 at 12:36 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> We have a handful of clk drivers that have a collection of slightly
> variant device support keyed off of the compatible string. In each of
> these drivers, we demux the variant and then call the "real" probe
> function based on whatever is stored in the match data for that
> compatible string. Let's generalize this function so that it can be
> re-used as the platform_driver probe function directly.

This looks really hacky to me. It sounds kind of general, but really
only works if we have match data that's a single function and we lose
any type checking on the function. What about things other than
platform devices?

Rob
