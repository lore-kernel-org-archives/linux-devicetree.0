From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] staging: iio: adc: mxs-lradc: Change type in printf format
 string
Date: Sun, 08 Feb 2015 12:07:48 +0000
Message-ID: <54D75194.40201@kernel.org>
References: <1422397413-9447-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
 <201501272359.59011.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <201501272359.59011.marex@denx.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Marek Vasut <marex@denx.de>, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, devel@driverdev.osuosl.org, Brian Vandre <bvandre@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, devicetree@vger.kernel.org, Vaishali Thakkar <vthakkar1994@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Peter Meerwald <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>, Grant Likely <grant.likely@linaro.org>, Robert Hodaszi <robert.hodaszi@digi.com>, Darshana Padmadas <darshanapadmadas@gmail.com>
List-Id: devicetree@vger.kernel.org

On 27/01/15 22:59, Marek Vasut wrote:
> On Tuesday, January 27, 2015 at 11:23:33 PM, Rickard Strandqvist wrote:
>> Wrong type in printf format string, requires 'int'
>> but the argument type is 'unsigned int'
>>
>> This was found using a static code analysis program called cppcheck
>>
>> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
> 
> Makes sense, thanks!
> 
> Reviewed-by: Marek Vasut <marex@denx.de>
Applied.
> 
> Best regards,
> Marek Vasut
> 
