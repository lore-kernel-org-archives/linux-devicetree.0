From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] ARM: l2x0: Add OF based initialization
Date: Fri, 08 Jul 2011 12:59:47 -0500
Message-ID: <4E174593.20107@gmail.com>
References: <1309984979-8847-1-git-send-email-robherring2@gmail.com>
	<1309984979-8847-2-git-send-email-robherring2@gmail.com>
	<20110706210237.GB5371@ponder.secretlab.ca>
	<201107062326.53737.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201107062326.53737.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, workgroup.linux-kQvG35nSl+M@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, weizeng.he-kQvG35nSl+M@public.gmane.org
List-Id: devicetree@vger.kernel.org

Russell,

On 07/06/2011 04:26 PM, Arnd Bergmann wrote:
> On Wednesday 06 July 2011 23:02:37 Grant Likely wrote:
>>
>> On Wed, Jul 06, 2011 at 03:42:59PM -0500, Rob Herring wrote:
>>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>>
>>> This adds probing for ARM L2x0 cache controllers via device tree. Support
>>> includes the L210, L220, and PL310 controllers. The binding allows setting
>>> up cache RAM latencies and filter addresses (PL310 only).
>>>
>>> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>
>> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>
>> By rights, this should go via the arm tree, but it depends on patches
>> that are already in devicetree/next.  Arnd, how do you want to handle
>> this?  I want to avoid rebasing devicetree/next.
> 
> It's outside of the scope of the arm-soc tree really, the l2x0 code
> is clearly core arm stuff, so it belongs into Russell's tree.
> 
> I think it's best if Russell can provide an Ack for this and you
> put it in the tree that already has the dependencies.
> 

Any comments?

Rob
