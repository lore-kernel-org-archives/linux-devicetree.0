From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFC PATCH v2 0/1] ARM: cpuidle: heterogeneous systems extension
Date: Tue, 21 Apr 2015 11:24:54 -0700
Message-ID: <CAMAWPa_fMhgFfL8krDxT9h42mydVogkaYQt1Me1qJTsKeH5dSA@mail.gmail.com>
References: <1429200617-9546-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1429200617-9546-1-git-send-email-lorenzo.pieralisi@arm.com>
Sender: linux-pm-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Howard Chen <howard.chen@linaro.org>, Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Lina Iyer <lina.iyer@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 16, 2015 at 9:10 AM, Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:

[...]

> This patch sets the maximum number of static CPUidle drivers allowed to
> two, since it is hard to foresee systems with more than two sets of CPUs
> having different idle states

It's not hard to forsee anymore:

   http://www.cnx-software.com/2015/04/21/mediatek-helio-x20-deca-core-processor/
   https://liliputing.com/2015/04/closer-look-at-mediateks-upcoming-10-core-helio-x20-processor.html

Kevin
