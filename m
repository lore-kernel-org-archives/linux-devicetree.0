From: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH v3 1/4] NAND: FSL-UPM: add multi chip support
Date: Wed, 25 Mar 2009 14:43:31 +0100
Message-ID: <49CA3503.5040006@grandegger.com>
References: <1237975701-23201-1-git-send-email-wg@grandegger.com>	
	<1237975701-23201-2-git-send-email-wg@grandegger.com>	
	<fa686aa40903250631w6a0cc8b9p3b2e3c1348e0acee@mail.gmail.com>
	<fa686aa40903250632o759921c8n1ae8d17286c1f976@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
In-Reply-To: <fa686aa40903250632o759921c8n1ae8d17286c1f976@mail.gmail.com>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss list <devicetree-discuss@ozlabs.org>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Wed, Mar 25, 2009 at 7:31 AM, Grant Likely <grant.likely@secretlab.ca> wrote:
>> On Wed, Mar 25, 2009 at 4:08 AM, Wolfgang Grandegger <wg@grandegger.com> wrote:
>>> This patch adds support for multi-chip NAND devices to the FSL-UPM
>>> driver. This requires support for multiple GPIOs for the RNB pins.
>>> The NAND chips are selected through address lines defined by the
>>> FDT property "chip-offset".
>>>
>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> Hi Wolfgang,
>>
>> Can you please send a sample device tree snippit for this and add
>> documentation updates to your patch for the extended binding?
> 
> Oh, and cc: devicetree-discuss@ozlabs.org in your next posting.

OK, does patch 3/4 not already contain what you are looking for? See:

http://ozlabs.org/pipermail/linuxppc-dev/2009-March/069787.html

I separated it from the NAND patches because they go through the MTD
maintainer(s).

BTW: did you have a chance to look into the following RFC on I2C bus
speed setting?

 http://ozlabs.org/pipermail/linuxppc-dev/2009-March/069489.html

Thanks,

Wolfgang.
