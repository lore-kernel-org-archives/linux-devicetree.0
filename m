From: "Chris Friesen" <cfriesen@nortel.com>
Subject: Re: Board level compatibility matching
Date: Thu, 31 Jul 2008 14:39:21 -0600
Message-ID: <489222F9.2020806@nortel.com>
References: <fa686aa40807311319k44d270b0t4fa9cb0e6523339@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <fa686aa40807311319k44d270b0t4fa9cb0e6523339@mail.gmail.com>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@ozlabs.org, linuxppc-dev <linuxppc-dev@ozlabs.org>
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:

> Doing so should simplify adding new board ports.  In many cases it
> would just involve dropping in a new .dts file.  However, it retains
> the flexability of overriding generic code with platform specific
> fixups as the need arises.

If it makes it easier for board vendors to do a clean port, you get a 
vote from me.

I've seen a large amount of vendor code from that needed a lot of 
massaging before it would play nice with support for similar boards from 
other vendors--not to mention how ugly it looked with all the 
board-specific ifdefs.

Chris
