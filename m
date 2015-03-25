From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2 0/5] Update the OF unittest and some small fix
Date: Tue, 24 Mar 2015 23:43:43 -0500
Message-ID: <CAL_JsqJXK31amM8xJ81wZ7O0xv_A7YOHP3GPxsyAnTNU7i1jFA@mail.gmail.com>
References: <1426063014-211712-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426063014-211712-1-git-send-email-long.wanglong@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wang Long <long.wanglong@huawei.com>
Cc: Gaurav Minocha <gaurav.minocha.os@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, peifeiyue@huawei.com, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 11, 2015 at 3:36 AM, Wang Long <long.wanglong@huawei.com> wrote:
> This series patches do some small fixes in drivers/of/unittest.c,
> and update the Documenttion.
>
> At last, replace selftest with unittest in the c, dtsi
> and binding files.
>
> * v2 <- v1:
>         - According to Gaurav's advice. make the rename
>         file patch correctly.
>
> Wang Long (5):
>   of/unittest: remove the duplicate of_changeset_init
>   of/unittest: Fix the wrong expected value in
>     of_selftest_property_string
>   Documentation: update the of_selftest.txt
>   Documentation: rename of_selftest.txt to of_unittest.txt
>   of/unittest: replace 'selftest' with 'unittest'

I've applied the series. Thanks.

Rob

>
>  Documentation/devicetree/bindings/unittest.txt     |  44 +-
>  .../{of_selftest.txt => of_unittest.txt}           |  35 +-
>  drivers/of/unittest-data/tests-overlay.dtsi        | 108 ++--
>  drivers/of/unittest.c                              | 703 ++++++++++-----------
>  4 files changed, 445 insertions(+), 445 deletions(-)
>  rename Documentation/devicetree/{of_selftest.txt => of_unittest.txt} (87%)
>
> --
> 1.8.3.4
>
