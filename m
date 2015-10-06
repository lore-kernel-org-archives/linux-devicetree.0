From: kbuild test robot <lkp@intel.com>
Subject: Re: [RFC][PATCH 2/2] staging: ion: Add files for parsing the
 devicetree (WIP)
Date: Wed, 7 Oct 2015 05:29:32 +0800
Message-ID: <201510070535.v0amqMb0%fengguang.wu@intel.com>
References: <1444164433-9107-3-git-send-email-labbott@fedoraproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444164433-9107-3-git-send-email-labbott@fedoraproject.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laura Abbott <labbott@fedoraproject.org>
Cc: kbuild-all@01.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, Andrew Andrianov <andrew@ncrmnt.org>, arve@android.com, Riley Andrews <riandrews@android.com>, Laura Abbott <laura@labbott.name>, John Stultz <john.stultz@linaro.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Gall <tom.gall@linaro.org>, Colin Cross <ccross@google.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, romlem@google.com, mitchelh@codeaurora.org, linux-arm-kernel@lists.infradead.org, Feng Tang <feng.tang@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Laura,

[auto build test WARNING on v4.3-rc4 -- if it's inappropriate base, please ignore]

reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/staging/android/ion/ion_of.c:31:5: sparse: symbol 'ion_parse_dt_heap_common' was not declared. Should it be static?
>> drivers/staging/android/ion/ion_of.c:70:5: sparse: symbol 'ion_setup_heap_common' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
