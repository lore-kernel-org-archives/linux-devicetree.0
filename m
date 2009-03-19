From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/9] of: add of_parse_phandle() helper for parsing
Date: Thu, 19 Mar 2009 00:01:02 -0600
Message-ID: <fa686aa40903182301l63d9319r40a9e8e20f89af5a@mail.gmail.com>
References: <d90126080903182237i6057e9afi9051723685bcb2d2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <d90126080903182237i6057e9afi9051723685bcb2d2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: sunder ramani <sunder.svit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, afleming-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 18, 2009 at 11:37 PM, sunder ramani <sunder.svit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> To Summarize, should not we have a phy_type flag in the OF tree which
> will let the PHY layer do the various PHY tasks based on if it is a
> copper/fiber interface. I really dont like my fix in my kernel and am
> new to open source. Do you think it is a valid argument? If it so, I
> would like to plan to introduce those changes and post to the
> community.

Yes, we probably do need some form of flag here for describing the PHY
interface.  Feel free to post a suggested binding for this.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
