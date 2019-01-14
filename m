From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v10 08/12] mfd: intel-peci-client: Add PECI client driver
Date: Mon, 14 Jan 2019 15:03:15 -0800
Message-ID: <7f63d8f1-2af6-e386-d5b2-c78e3881d789@linux.intel.com>
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-9-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xet1HUbC4MN-XO31oZj56+af1Lpc_mtee-COSYizedWTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACPK8Xet1HUbC4MN-XO31oZj56+af1Lpc_mtee-COSYizedWTg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Darrick J . Wong" <darrick.wong@oracle.com>, Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>, "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, "David S . Miller" <davem@davemloft.net>, Mauro
List-Id: devicetree@vger.kernel.org

On 1/14/2019 3:42 AM, Joel Stanley wrote:
> On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> This commit adds PECI client driver.
> 
> It looks like it's a PECI driver for the three CPU families, and it
> implements cpu and dimm temp, with sideband functions deferred to the
> future. If you add that information with a few more words it would
> make for a nicer commit message.
> 

Yes, that would be nicer. I'll add the description into the commit
message.

Thanks for your review!

Regards,
Jae

>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
