From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH 6/7] mtd: nand: davinci: extend description of bindings
Date: Wed, 20 Nov 2013 17:54:04 +0200
Message-ID: <528CDB1C.1010806@ti.com>
References: <1384960945-14528-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1384960945-14528-7-git-send-email-ivan.khoronzhuk@ti.com>
 <201311201646.21435.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <201311201646.21435.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, grygorii.strashko@ti.com, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/20/2013 05:46 PM, Arnd Bergmann wrote:
> On Wednesday 20 November 2013, Ivan Khoronzhuk wrote:
>> Extend bindings for davinci_nand driver to be more clear.
>>
>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
>> ---
>>   .../devicetree/bindings/mtd/davinci-nand.txt       |   77 ++++++++++++++------
>>   1 file changed, 54 insertions(+), 23 deletions(-)
>
> Hi Ivan,
>
> The changes look good to me, but please clarify in the changeset description
> above whether this is a backwards-compatible change, a clarification without
> semantic changes, or an incompatible change (which should be avoided).
>
> 	Arnd
>

This is a clarification only, without semantic changes.
Thanks, I'll update.

-- 
Regards,
Ivan Khoronzhuk

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
