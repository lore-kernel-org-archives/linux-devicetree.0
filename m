From: "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: "Early" devices and the DT
Date: Sun, 26 Jun 2011 15:24:43 -0600
Message-ID: <4f20d688-0cbb-48e7-830c-69cf57d902ba@email.android.com>
References: <1308924659-31894-1-git-send-email-marc.zyngier@arm.com>
	<1308924659-31894-3-git-send-email-marc.zyngier@arm.com>
	<20110625204742.GB15026@ponder.secretlab.ca>
	<4E06513B.4030706@gmail.com>
	<BANLkTimy6iyQyyvNUK3Kc6skSKyVxBwWPA@mail.gmail.com>
	<4E0786FF.9010002@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E0786FF.9010002-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:

>Some solutions to the early device problem
>
>a) Most complex:  Use new properties to create a dependency graph. 
>This 
>is probably the most general solution, but also probably the hardest
>for 
>people to think about and maintain.
>
>b) Define a set of init phases 0,1,2,...  and mark each early device 
>node with a phase number property.  Scan the tree for each phase and 
>handle only the devices with that phase number.  Unmarked nodes are 
>handled last.
>
>c) Similar to b, but instead of properties in nodes, have properties 
>like "linux-phase0", "linux-phase1", etc in /chosen, whose values are 
>lists of phandles.

d) don't try to encode init order at all in the DT, and let device drivers request probe to be deferred.  If this works out, it will be by far the least complex and won't require anybody to sit and work out the init order for each machine.  I've even already posted a draft patch to do this.

e) work out probe order dynamically by looking at known phandle types at device registration time. This is potentially more 'efficient' than option d, but it requires a lot of knowledge to be built into the registration code which will get really complex in a hurry.

Right now I'm strongly leaning in the direction of option d.

g.

-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
