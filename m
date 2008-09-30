From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/9 V3] Remove support for the legacy DTS source file
	format.
Date: Tue, 30 Sep 2008 11:30:19 -0500
Message-ID: <48E2541B.1000801@freescale.com>
References: <1222460748-20127-1-git-send-email-jdl@jdl.com>	<1222460748-20127-2-git-send-email-jdl@jdl.com>
	<20080930055716.GA18695@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20080930055716.GA18695-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

David Gibson wrote:
> On Fri, Sep 26, 2008 at 03:25:40PM -0500, Jon Loeliger wrote:
>> Now that all in-kernel-tree DTS files are properly /dts-v1/,
>> remove direct support for the older, un-numbered DTS
>> source file format.
>>
>> Convert existing tests to /dts-v1/ and remove support
>> for the conversion tests themselves.
>>
>> For now, though, the conversion tool still exists.
> 
> Hrm.  Again, I don't think we should need to do this.

Older dtc versions are still around for those that need them...  IIUC, 
keeping the old syntax around will complicate the code when adding the 
new features.

-Scott
