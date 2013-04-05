From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2 0/9] rm: mvebu: Enable LPAE support for Armada XP SoCs
Date: Fri, 05 Apr 2013 23:10:48 +0200
Message-ID: <515F3DD8.2040108@free-electrons.com>
References: <1365193444-13441-1-git-send-email-gregory.clement@free-electrons.com>
 <201304052246.12731.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201304052246.12731.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Grant Likely <grant.likely@secretlab.ca>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Nadav Haklai <nadavh@marvell.com>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org, Maen Suleiman <maen@marvell.com>
List-Id: devicetree@vger.kernel.org

On 04/05/2013 10:46 PM, Arnd Bergmann wrote:
> On Friday 05 April 2013, Gregory CLEMENT wrote:
>> The Armada XP SoCs have LPAE support. This is the second version patch
>> set whixh allow to run kernel on this SoCs with LPAE support.
>>
>> The biggest changes are the conversion of the device tree file to 64
>> bits in order to be able to use more than 4GB of memory (without this
>> the LPAE is pointless).
>>
> 
> The series looks good overall, I've commented on trivial details.

So there is still hope to have this patch set in 3.10 :)

> 
> Also, please use "ARM: mvebu: ..." in the subject rather than the lower-case
> version.

OK I will, but I saw a lot of 'arm' written in lower-case int the subject of emails
on the LAKML.
> 
> 	Arnd
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
