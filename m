From: Daniel Mack <zonque@gmail.com>
Subject: Re: Appended DTB files for multi-machine kernels
Date: Fri, 26 Jul 2013 18:13:08 +0200
Message-ID: <51F2A014.7000209@gmail.com>
References: <51D5A938.30607@gmail.com>
 <alpine.LFD.2.03.1307041322070.18597@syhkavp.arg>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.LFD.2.03.1307041322070.18597@syhkavp.arg>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Pitre <nico@fluxnic.net>
Cc: stigge@antcom.de, Stephen Warren <swarren@nvidia.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Sven Neumann <s.neumann@raumfeld.com>, Mark Brown <broonie@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 04.07.2013 19:28, Nicolas Pitre wrote:
> On Thu, 4 Jul 2013, Daniel Mack wrote:
>> In short, devices that have been deployed in quantities come in three
>> hardware variants, which all boot with a unique machine-id. We ship
>> kernel images that have board support for all three machine types, and
>> do minor fixups to platform data of some drivers at runtime, depending
>> on the board revision number (passed in via ATAGs).
>>

> What you describe above more or less fits the definition of what I 
> called the "impedance matcher".  However it doesn't need to be part of 
> the kernel at all.  But you should make it into a separate binary.
> 
> Please have a look at the bottom of this post for a more comprehensive 
> description: http://article.gmane.org/gmane.linux.ports.arm.kernel/242929

FWIW, I gave that approach a try today for a PXA based hardware
platform, and in fact it seems to work very well. Thanks again for
sharing the idea.

In case anyone is interested, the repository is here:

  https://github.com/zonque/pxa-impedance-matcher

As the README says, it's completely specific to my use case, but maybe
anyone can use the code base to spin a different version for a different
board.


Daniel
