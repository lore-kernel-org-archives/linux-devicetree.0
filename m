From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V7 4/4] dmaengine: qcom_hidma: add MSI support for
 interrupts
Date: Sun, 23 Oct 2016 19:55:29 -0700
Message-ID: <36163853-ac4a-e146-0c1b-eaf42e8b234d@codeaurora.org>
References: <1477067879-23750-1-git-send-email-okaya@codeaurora.org>
 <1477067879-23750-5-git-send-email-okaya@codeaurora.org>
 <CAHp75Vd+u5va3kyqcapeF9JATUfv5gBnoEM_W+frDmMXs5f2Uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vd+u5va3kyqcapeF9JATUfv5gBnoEM_W+frDmMXs5f2Uw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: dmaengine <dmaengine@vger.kernel.org>, Timur Tabi <timur@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, Christopher Covington <cov@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Jon Masters <jcm@redhat.com>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/21/2016 12:11 PM, Andy Shevchenko wrote:
>> +static void hidma_free_msis(struct hidma_dev *dmadev)
>> > +{
>> > +#ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
> Perhaps one #ifdef and two definitions of functions?

I don't think it will make a difference. I'll have to move
#ifdef around the caller of hidma_free_msis instead which
I think is uglier.

The hidma_write_msi_msg function gets called only when 
CONFIG_GENERIC_MSI_IRQ_DOMAIN is defined. If I don't put 
this around the function definition, I get unused function
warning from the compiler. This is the reason why preprocessor
definition is outside of the function definition.


-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
