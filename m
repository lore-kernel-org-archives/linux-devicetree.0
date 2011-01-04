From: "Blanchard, Hollis" <Hollis_Blanchard@mentor.com>
Subject: Re: [RFC] MPIC Bindings and Bindings for AMP Systems
Date: Tue, 4 Jan 2011 12:14:47 -0800
Message-ID: <DD7A9A95166BF4418C4C1EB2033B6EE2038FA8C5@na3-mail.mgc.mentorg.com>
References: <4D12F171.7010103@mentor.com>
	<20101223185623.GA20384@angua.secretlab.ca>
	<4D13C402.2090209@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-class: urn:content-classes:message
In-Reply-To: <4D13C402.2090209@mentor.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: "Inge, Meador" <meador_inge@mentor.com>, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 12/23/2010 01:49 PM, Meador Inge wrote:
>
> We can't just remove the IRQ of the _other_ OS from the 'interrupts' 
> property in the message node because we need to know the IRQ in order 
> to talk to the other OS.  So, we use protected sources to tell the OS 
> that an IRQ is not available for its own use, while at the same time 
> keeping 
> complete information on all the IRQ mappings for the message registers.
There's a simpler and more fundamental problem: the Linux MPIC driver 
initializes the "VECPRI" register for all interrupt sources (which is 
how you associate a source with a vector). We need the Linux driver not 
to do this.

(The "no-reset" property solves a related problem: it tells the driver 
not to use the hardware's special "reset all registers" bit.)

Hollis Blanchard
Mentor Graphics, Embedded Systems Division
