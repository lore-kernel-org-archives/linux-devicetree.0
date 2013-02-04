From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 0/4] mfd/regulator: tps65090: add DT support and suspend/resume
 cleanups
Date: Mon, 4 Feb 2013 09:10:51 +0530
Message-ID: <510F2DC3.2060803@nvidia.com>
References: <1356686981-4152-1-git-send-email-ldewangan@nvidia.com> <20130203141931.GA8476@sortiz-mobl> <20130203223304.GB24304@sortiz-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130203223304.GB24304@sortiz-mobl>
Sender: linux-doc-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "lrg@ti.com" <lrg@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Monday 04 February 2013 04:03 AM, Samuel Ortiz wrote:
> Hi Laxman,
>
> On Sun, Feb 03, 2013 at 03:19:31PM +0100, Samuel Ortiz wrote:
>> Hi Laxman,
>>
>> On Fri, Dec 28, 2012 at 02:59:37PM +0530, Laxman Dewangan wrote:
>>> The patch series add DT support on TPS65090 device.
>>>
>>> Also remove the suspend/resume implementation as it duplicates with
>>> irq_suspend/irq_resume().
>>>
>>> Laxman Dewangan (4):
>>>    mfd: tps65090: add DT support for tps65090
>>>    regulator: tps65090: add DT support
>>>    mfd: tps65090: Pass irq domain when adding mfd sub devices
>>>    mfd: tps65090: remove suspend/resume callbacks
>>>
>>>   .../devicetree/bindings/regulator/tps65090.txt     |  121 ++++++++++++++++++++
>>>   drivers/mfd/tps65090.c                             |   77 ++++++++----
>>>   drivers/regulator/tps65090-regulator.c             |   96 +++++++++++++++-
>>>   include/linux/mfd/tps65090.h                       |    1 +
>>>   4 files changed, 266 insertions(+), 29 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/regulator/tps65090.txt
>> All 4 patches applied to my for-next branch, thanks.
> Sorry for the confusion: I took v2 of your patchset, skipping the regulator
> patch who will go through Mark's tree.

Thank you very much. The regulator patch is already applied in Mark's tree.

Thanks,
Laxman
