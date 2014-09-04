From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCHv10 1/2] edac: altera: Add Altera SDRAM EDAC support.
Date: Thu, 4 Sep 2014 13:56:22 -0500
Message-ID: <5408B5D6.6020101@opensource.altera.com>
References: <1407770293-27190-1-git-send-email-tthayer@opensource.altera.com>
 <1407770293-27190-2-git-send-email-tthayer@opensource.altera.com>
 <20140829160204.GA8835@nazgul.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140829160204.GA8835@nazgul.tnic>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Borislav Petkov <bp@alien8.de>, tthayer@opensource.altera.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, sameo@linux.intel.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, atull@opensource.altera.com, dougthompson@xmission.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, rob@landley.net, galak@codeaurora.org, grant.likely@linaro.org, lee.jones@linaro.org, delicious.quinoa@gmail.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/29/2014 11:02 AM, Borislav Petkov wrote:
> On Mon, Aug 11, 2014 at 10:18:12AM -0500, tthayer@opensource.altera.com wrote:
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> This patch adds support for the CycloneV and ArriaV SDRAM controllers.
>> Correction and reporting of SBEs, Panic on DBEs.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> ---
>> v2: Use the SDRAM controller registers to calculate memory size
>>     instead of the Device Tree. Update To & Cc list. Add maintainer
>>     information.
>>
>> v3: EDAC driver cleanup based on comments from Mailing list.
>>
>> v4: Panic on DBE. Add macro around inject-error reads to prevent
>>     them from being optimized out. Remove of_match_ptr since this
>>     will always use Device Tree.
>>
>> v5: Addition of printk to trigger function to ensure read vars
>>     are not optimized out.
>>
>> v6: Changes to split out shared SDRAM controller reg (offset 0x00)
>>     as a syscon device and allocate ECC specific SDRAM registers
>>     to EDAC.
>>
>> v7: No changes. Bump for consistency.
>>
>> v8: Alphabetize headers.
>>
>> v9: Changes to support a MFD SDRAM controller with nested EDAC.
>>
>> v10: Revert to version 5 (syscon) and fix errors found in v5.
> 
> EDAC bits look ok to me,
> 
> Acked-by: Borislav Petkov <bp@suse.de>
> 
> Dinh, please convert that version information above to a nice commit
> message and add it when applying as it is very useful for future
> reference.
> 

Thank Boris. I had to fix up the patch a bit by making EDAC_ALTERA_MC a
tristate instead of bool to prevent a build error with allmodconfig.

Dinh
> Thanks.
> 
