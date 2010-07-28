From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH v2 1/2] MIPS: Add device tree support to MIPS
Date: Wed, 28 Jul 2010 22:33:20 +0100
Message-ID: <20100728213320.GA11538@linux-mips.org>
References: <20100727214948.GA29241@dediao-lnx2.corp.sa.net>
 <AANLkTi=a=tGURpMKo7g+32LMcFovx4GJk2Wid6vmvQt8@mail.gmail.com>
 <4C5082BE.5050203@caviumnetworks.com>
 <AANLkTi=74zoQziQTmAGo-cNtF9FAT77h+KZagsNEFjEf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=74zoQziQTmAGo-cNtF9FAT77h+KZagsNEFjEf@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: David Daney <ddaney@caviumnetworks.com>, Dezhong Diao <dediao@cisco.com>, devicetree-discuss@lists.ozlabs.org, linux-mips@linux-mips.org, dvomlehn@cisco.com
List-Id: devicetree@vger.kernel.org

On Wed, Jul 28, 2010 at 01:25:52PM -0600, Grant Likely wrote:

> It would probably be best if I at least pick up the first patch into
> my test tree to give it a spin with the latest changes.  I'd be happy
> to take the 2nd too to avoid ordering issues.

Makes sense and even though this patch applies to arch/mips it's probably
more of an DT than a MIPS patch.

That said a long standing problem is that code that is relevant to MIPS
tends to get tested only if it's in one of the MIPS trees but far less in
other trees such as -next.

  Ralf
