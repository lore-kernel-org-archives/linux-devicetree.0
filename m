From: Mitch Bradley <wmb@firmworks.com>
Subject: Re: Boot interface for device trees on ARM
Date: Tue, 18 May 2010 21:25:38 -1000
Message-ID: <4BF39272.7070909@firmworks.com>
References: <201005181054.32325.jeremy.kerr@canonical.com>	<alpine.LFD.2.00.1005172341200.12758@xanadu.home>	<201005181324.45701.jeremy.kerr@canonical.com>	<20100518084954.GC25892@yookeroo>
	<alpine.LFD.2.00.1005180802010.12758@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.LFD.2.00.1005180802010.12758@xanadu.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Pitre <nico@fluxnic.net>
Cc: nicolas.pitre@canonical.com, Jeremy Kerr <jeremy.kerr@canonical.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

Nicolas Pitre wrote:
> ...
> Exact.  For example, on ARM the machine ID is also used to figure out 
> the MMU mapping needed to be able to simply be able to debug the very 
> early assembly boot stage when there isn't even a stack available. While 
> this info is stored in the machine record, it is actually 
> subarchitecture specific and already half-digested for easy usage by 
> that initial MMU setup.  I just don't want to imagine what the 
> equivalent functionality with DT would look like.
>
>
>   

Under what circumstances would the Linux startup code not have a stack - 
or not be able to set up one easily?
