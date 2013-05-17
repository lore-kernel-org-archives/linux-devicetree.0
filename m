From: Libo Chen <clbchenlibo.chen@huawei.com>
Subject: Re: [PATCH] usb: omap2430: fix memleak in err case
Date: Fri, 17 May 2013 12:49:26 +0800
Message-ID: <5195B6D6.7030504@huawei.com>
References: <5192E650.3070303@huawei.com> <519377C4.1040800@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <519377C4.1040800@cogentembedded.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, linux-mips@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

On 2013/5/15 19:55, Sergei Shtylyov wrote:
> Hello.
> 
> On 15-05-2013 5:35, Libo Chen wrote:
> 
>> when omap_get_control_dev fail, we should release relational platform_device
> 
>    s/fail/fails/, s/relational/related/?
> 
>> Signed-off-by: Libo Chen <libo.chen@huawei.com>
> 
>    You've posted this to the wrong mailing list, linux-mips; devicetree-discuss also seems hardly related.
> 
> WBR, Sergei
> 
> 
> 

Hi Sergei,

Thank you for your remind.
