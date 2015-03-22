From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] of: handle both '/' and ':' in path strings
Date: Sun, 22 Mar 2015 15:04:43 -0500
Message-ID: <CAL_JsqKhiZ4iE+D9WcgSZNg5_N_vdf=ec0QooAn932+Q75Gokg@mail.gmail.com>
References: <1425924225-22748-2-git-send-email-leif.lindholm@linaro.org> <1426620632-23383-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1426620632-23383-1-git-send-email-computersforpeace@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, Leif Lindholm <leif.lindholm@linaro.org>, stable <stable@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 2:30 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Commit 106937e8ccdc ("of: fix handling of '/' in options for
> of_find_node_by_path()") caused a regression in OF handling of
> stdout-path. While it fixes some cases which have '/' after the ':', it
> breaks cases where there is more than one '/' *before* the ':'.
>
> For example, it breaks this boot string
>
>   stdout-path = "/rdb/serial@f040ab00:115200";
>
> So rather than doing sequentialized checks (first for '/', then for ':';
> or vice versa), to get the correct behavior we need to check for the
> first occurrence of either one of them.
>
> It so happens that the handy strcspn() helper can do just that.
>
> Fixes: 106937e8ccdc ("of: fix handling of '/' in options for of_find_node_by_path()")
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: stable@vger.kernel.org

Thanks. Applied both and in Linus' tree now.

Rob
