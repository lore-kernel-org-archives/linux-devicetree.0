From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2 0/2] of: Dynamic DT updates
Date: Wed, 16 Sep 2015 11:43:51 -0500
Message-ID: <CAL_JsqJORsJ8aA3DLuHAVovKX-wdx8m7_NCYA4kheumvyxScTg@mail.gmail.com>
References: <1442419866-4982-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442419866-4982-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 16, 2015 at 11:11 AM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
> The two patches add a new API for using changeset which
> makes things considerably easier.
>
> This patchset applies against Linus's tree as of today and
> is dependent on the previous patchset I've send out earlier.
> "of: overlay: kobject & sysfs'ation"

Oh good, I'll ignore it until that is merged. ;) Seriously, this
doesn't really look dependent. It doesn't involve ABIs either, so it
is easier.

Rob

>
> Changes since v1:
> * Dropped the indirect and target root patches until we
> figure out what to do with the DT connector.
>
> Pantelis Antoniou (2):
>   of: dynamic: Add __of_node_dupv()
>   of: changesets: Introduce changeset helper methods
>
>  drivers/of/dynamic.c | 280 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  include/linux/of.h   |  74 ++++++++++++++
>  2 files changed, 348 insertions(+), 6 deletions(-)
>
> --
> 1.7.12
>
