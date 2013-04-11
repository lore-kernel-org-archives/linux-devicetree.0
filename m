From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v3 5/9] ARM: dts: Add a 64 bits version of the skeleton
 device tree
Date: Thu, 11 Apr 2013 22:48:27 +0200
Message-ID: <5167219B.8070404@free-electrons.com>
References: <1365461538-30702-1-git-send-email-gregory.clement@free-electrons.com> <1365461538-30702-6-git-send-email-gregory.clement@free-electrons.com> <20130411181200.GP28693@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130411181200.GP28693@titan.lakedaemon.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>, Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>, Grant Likely <grant.likely@secretlab.ca>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org, Maen Suleiman <maen@marvell.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Jason,

On 04/11/2013 08:12 PM, Jason Cooper wrote:
> On Tue, Apr 09, 2013 at 12:52:13AM +0200, Gregory CLEMENT wrote:
>> From: Lior Amsalem <alior@marvell.com>
>>
>> In order to be able to use more than 4GB address-cells and size-cells
>> have to be set to 2
>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
>> Signed-off-by: Lior Amsalem <alior@marvell.com>
>> ---
>>  arch/arm/boot/dts/skeleton64.dtsi |   13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/skeleton64.dtsi
> 
> Applied to mvebu/dt
> 
> Gregory,
> 
> Once I can pull in Thomas' pci work, you'll just need to rebase patches
> 1, and 6 - 9 against mvebu/dt.
> 

Yes sure! When did you plan to pull the dts part of Thomas' pci work?
Is there still anything left to prevent to pull this part?

Thanks,
-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
