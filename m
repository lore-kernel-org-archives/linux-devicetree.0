From: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: hex number case in dts files.
Date: Thu, 9 Feb 2012 16:29:50 -0800
Message-ID: <20120210002950.GA18408@codeaurora.org>
References: <20120209180411.GA5654@codeaurora.org> <4F340E71.7070004@gmail.com>
 <20120210001921.GA10536@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120210001921.GA10536-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 10, 2012 at 11:19:21AM +1100, David Gibson wrote:
> On Thu, Feb 09, 2012 at 12:20:33PM -0600, Rob Herring wrote:
> > On 02/09/2012 12:04 PM, David Brown wrote:
> > > I've noticed an inconsistency in the case of letters in hex constants
> > > in various dts files.  The ones that are actually numbers probably
> > > don't really matter, the but the node names are case sensitive
> > > strings, and in some sense do matter.
> > > 
> > > I ask because some people I've spoken with internally seem to have
> > > strong opinions about what case hex constants should be, and it'd be
> > > nice to be able to have some guideline about this.  Historically, I've
> > > always seen DT hex values in lowercase.
> > > 
> > 
> > Lower case should be used for dts files.
> 
> Yes, the node names should always have the hex done in lower case.  I
> have plans to put more checks in for how reg is encoded into node
> names, but just need to get time.

What about number of digits?  Should a register at 0x42 be
node@00000042 or node@42?  Again, I'm seeing both.

Thanks,
David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
