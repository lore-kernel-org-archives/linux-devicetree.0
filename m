From: Jeremy Kerr <jeremy.kerr@au1.ibm.com>
Subject: Re: [PATCH] drivers/core/of: Add symlink to device-tree from devices
 with an OF node
Date: Wed, 19 Nov 2014 10:53:11 +1100
Message-ID: <546BDBE7.4040604@au1.ibm.com>
References: <1415342031.4925.27.camel@kernel.crashing.org> <1415342117.4925.29.camel@kernel.crashing.org> <1415596626.5769.14.camel@kernel.crashing.org> <CAL_JsqKG=vpeGKj3v-2VW9oGQsnmuYMHRfy6LuXDXE=ROjHT4w@mail.gmail.com> <1415841047.5124.62.camel@kernel.crashing.org> <CAL_Jsq+YyfMWxiOFv4x3g5hZJH0XRqCKj2He1XO9eyXWjHTMrg@mail.gmail.com> <546BD8BD.2010605@au1.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <546BD8BD.2010605@au1.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Greg KH <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> struct device doesn't have an of_node member if !CONFIG_OF, so we'll
> need to disable this block in the preprocessor.

Scratch that, I was looking at the wrong header - we do indeed have the
of_node available independently of CONFIG_OF, and this makes the logic a
little cleaner.

Cheers,


Jeremy
