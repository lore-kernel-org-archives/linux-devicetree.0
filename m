From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCHv5 8/8] ARM: dts: Add Arria10 Ethernet EDAC devicetree entry
Date: Mon, 27 Jun 2016 11:13:05 -0500
Message-ID: <57715091.30203@opensource.altera.com>
References: <1466603939-7526-1-git-send-email-tthayer@opensource.altera.com>
 <1466603939-7526-9-git-send-email-tthayer@opensource.altera.com>
 <577146D1.40106@opensource.altera.com> <20160627161824.GA5300@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160627161824.GA5300@pd.tnic>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Borislav Petkov <bp@alien8.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, robh+dt@kernel.org, tthayer@opensource.altera.com, dougthompson@xmission.com, grant.likely@linaro.org, linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

On 06/27/2016 11:18 AM, Borislav Petkov wrote:
> On Mon, Jun 27, 2016 at 10:31:29AM -0500, Dinh Nguyen wrote:
>> I've applied this patch and will take through the arm-soc tree.
> 
> I already took the whole branch two days ago:
> 
> http://git.kernel.org/cgit/linux/kernel/git/bp/bp.git/log/?h=for-next
> 
> So we need to sort this out as it has come up in the past. Either you
> pick up all patches and I ack them or I do and you ack the one. But
> splitting the patchset between trees is always calling for trouble.
> 
> So what are doing, wanna give me your Ack for that patch instead and I
> can carry the whole set upstream?
> 

Ok, sorry about that. Please carry the whole set:

Acked-by: Dinh Nguyen <dinguyen@opensource.altera.com>

Dinh
