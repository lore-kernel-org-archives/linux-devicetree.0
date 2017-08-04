From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v1 0/3] ipmi: bt-i2c: added IPMI Block Transfer over I2C
Date: Fri, 4 Aug 2017 16:25:40 -0700
Message-ID: <CAFd5g45K3jK+pADuMy3vPDZgKx2vV66VJiCQrTp4koYBsSR05A@mail.gmail.com>
References: <20170804231854.19730-1-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170804231854.19730-1-brendanhiggins@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, openipmi-developer@lists.sourceforge.net, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 4, 2017 at 4:18 PM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> This patchset introduces IPMI Block Transfer over I2C (BT-I2C), which has the
> same semantics as IPMI Block Transfer except it done over I2C.
>
> The documentation discusses the reason for this in greater detail, suffice it to
> say SSIF cannot be correctly implemented on some naive I2C devices. There are
> some additional reasons why we don't like SSIF, but those are again covered in
> the documentation for all those who are interested.
>
> In addition, since I am adding both host side and BMC side support, I figured
> that now is a good time to resolve the problem of where to put BMC side IPMI
> drivers; right now we have it (there is only one) in drivers/char/ipmi/ with the
> rest of the host side IPMI drivers, but I think it makes sense to put all of the
> host side IPMI drivers in one directory and all of the BMC side drivers in
> another, preferably in a way that does not effect all of the current OpenIPMI
> users. I have not created a MAINTAINERS entry for the new directory yet, as I
> figured there might be some discussion to be had about it.
>
> I have tested this patchset on the Aspeed 2500 EVB.

I forgot to mention, for the OpenBMC people, this is based on an RFC:
https://lists.ozlabs.org/pipermail/openbmc/2016-September/004505.html
