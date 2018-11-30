From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 6/6] char: fastrpc: Add support for compat ioctls
Date: Fri, 30 Nov 2018 14:46:27 +0100
Message-ID: <CAK8P3a3DsADgQo7b1B5vWV2Ws8mOpB1ixbi5tR=Z6cfvp+eZpA@mail.gmail.com>
References: <20181130104657.14875-1-srinivas.kandagatla@linaro.org>
 <20181130104657.14875-7-srinivas.kandagatla@linaro.org> <CAK8P3a1XaGHu3NrAeLn0OEg0nL1uae_MyrP7EgadJpfeeXtR2Q@mail.gmail.com>
 <2dbd06c5-d094-6d16-2983-131d3ae24c8d@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2dbd06c5-d094-6d16-2983-131d3ae24c8d@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.escande@linaro.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, gregkh <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com
List-Id: devicetree@vger.kernel.org

On Fri, Nov 30, 2018 at 2:20 PM Thierry Escande
<thierry.escande@linaro.org> wrote:
> On 30/11/2018 13:58, Arnd Bergmann wrote:
> > On Fri, Nov 30, 2018 at 11:48 AM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >>
> >> From: Thierry Escande <thierry.escande@linaro.org>
> >>
> >> This patch adds support for compat ioctl from 32 bits userland to
> >> Qualcomm fastrpc driver.
> >>
> >> Supported ioctls in this change are INIT, INVOKE, and ALLOC/FREE_DMA.
> >>
> >> Most of the work is derived from various downstream Qualcomm kernels.
> >> Credits to various Qualcomm authors who have contributed to this code.
> >> Specially Tharun Kumar Merugu <mtharu@codeaurora.org>
> >>
> >> Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >
> > Can't you just define the native ioctls so that you don't need this.
>
> There are long time defined structures that are passed as argument to
> these ioctls and their sizes vary between 32 and 64 bits userlands, so
> the ioctl command values.

Where? I don't see them in linux-4.19.

> Unless I'm missing something here this also has the advantage not to be
> compiled if CONFIG_COMPAT is not set.

You can normally just set .compat_ioctl() to the same function as
.unlocked_ioctl(), and get no overhead either way.

    Arnd
