From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v2 0/5] Update the OF unittest and some small fix
Date: Sat, 28 Mar 2015 13:23:47 +0000
Message-ID: <20150328132347.84128C4093E@trevor.secretlab.ca>
References: <1426063014-211712-1-git-send-email-long.wanglong@huawei.com>
	<CAL_JsqJXK31amM8xJ81wZ7O0xv_A7YOHP3GPxsyAnTNU7i1jFA@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJXK31amM8xJ81wZ7O0xv_A7YOHP3GPxsyAnTNU7i1jFA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Wang Long <long.wanglong@huawei.com>
Cc: Gaurav Minocha <gaurav.minocha.os@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, peifeiyue@huawei.com, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: devicetree@vger.kernel.org

On Tue, 24 Mar 2015 23:43:43 -0500
, Rob Herring <robherring2@gmail.com>
 wrote:
> On Wed, Mar 11, 2015 at 3:36 AM, Wang Long <long.wanglong@huawei.com> wrote:
> > This series patches do some small fixes in drivers/of/unittest.c,
> > and update the Documenttion.
> >
> > At last, replace selftest with unittest in the c, dtsi
> > and binding files.
> >
> > * v2 <- v1:
> >         - According to Gaurav's advice. make the rename
> >         file patch correctly.
> >
> > Wang Long (5):
> >   of/unittest: remove the duplicate of_changeset_init
> >   of/unittest: Fix the wrong expected value in
> >     of_selftest_property_string
> >   Documentation: update the of_selftest.txt
> >   Documentation: rename of_selftest.txt to of_unittest.txt
> >   of/unittest: replace 'selftest' with 'unittest'
> 
> I've applied the series. Thanks.

Hmmm, I neglected to update my git tree before getting on an airplane
and merging patches. I may have pushed out conflicts to my tree. If I've
done so, then I'll fix it up this weekend.

g.
