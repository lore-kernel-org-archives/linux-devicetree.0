From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 0/2] of: fix handling of '/' in path options
Date: Wed, 11 Mar 2015 07:49:33 -0500
Message-ID: <CAL_JsqK=cODtAgt5jRQ-ASPBVatUztjOwDcZ6vzOh9bDKMdSBA@mail.gmail.com>
References: <1425924225-22748-1-git-send-email-leif.lindholm@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425924225-22748-1-git-send-email-leif.lindholm@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leif Lindholm <leif.lindholm@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Peter Hurley <peter@hurleysoftware.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 9, 2015 at 1:03 PM, Leif Lindholm <leif.lindholm@linaro.org> wrote:
> Commit 7914a7c5651a ("of: support passing console options with
> stdout-path") neglected to deal with '/'s appearing past the ':'
> terminator.
>
> This mini-series fixes this oversight and adds the tests to prove it.
>
> Leif Lindholm (1):
>   of: fix handling of '/' in options for of_find_node_by_path()
>
> Peter Hurley (1):
>   of: unittest: Add options string testcase variants

Are there changes from the previous versions? I've already pulled those in.

Rob

>
>  drivers/of/base.c     | 23 +++++++++++++++--------
>  drivers/of/unittest.c | 11 +++++++++++
>  2 files changed, 26 insertions(+), 8 deletions(-)
>
> --
> 2.1.4
>
