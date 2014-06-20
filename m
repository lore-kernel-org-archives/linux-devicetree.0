From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: Re: [PATCH] staging: imx-drm: ipu-v3: ipu-common.c: Cleaning up
 return of uninitialized variable
Date: Fri, 20 Jun 2014 13:20:43 +0200
Message-ID: <CAFo99gZKXEVVxZX12pqiaPuD2RqN=qxkKezSoP09ECSj37waSA@mail.gmail.com>
References: <1402788921-15458-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
 <1402788921-15458-2-git-send-email-rickard_strandqvist@spectrumdigital.se>
 <20140619225100.GA15258@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20140619225100.GA15258@kroah.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, devel@driverdev.osuosl.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Valentina Manea <valentina.manea.m@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

Hi

The mainline form about Jun 6.
And now it is in  drivers/gpu/ipu-v3/ipu-common.c
Still with the same error.

Sorry, I have started to compare to linux-next, but I do it as:
diff `find . ../linux-next/ -name ipu-common.c`
So missed that the file had moved :-/

Ok, I send a new patch then..


Kind regards
Rickard Strandqvist


2014-06-20 0:51 GMT+02:00 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
> On Sun, Jun 15, 2014 at 01:35:21AM +0200, Rickard Strandqvist wrote:
>> Before when there was an error a uninitialized variable would be returnd.
>> Now it returns -ENODEV
>>
>> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
>> ---
>>  drivers/staging/imx-drm/ipu-v3/ipu-common.c |    4 ++--
>
> This file isn't even in the tree anymore, what did you make this patch
> against?
