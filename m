From: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Subject: Re: [PATCH] openrisc: Add DTS and defconfig for DE0-Nano
Date: Sat, 16 Nov 2013 10:45:06 +0200
Message-ID: <20131116084505.GA26233@chokladfabriken.org>
References: <1384029451-16555-1-git-send-email-geert@linux-m68k.org>
	<5285EE5A.1070202@southpole.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
Content-Disposition: inline
In-Reply-To: <5285EE5A.1070202@southpole.se>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Jonas Bonn <jonas@southpole.se>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Mehall <contact@kevinmehall.net>, linux@lists.openrisc.net
List-Id: devicetree@vger.kernel.org

On Fri, Nov 15, 2013 at 10:50:18AM +0100, Jonas Bonn wrote:
> >+
> >+	i2c0: ocores@a0000000 {
> >+		#address-cells = <1>;
> >+		#size-cells = <0>;
> >+		compatible = "opencores,i2c-ocores";
> 
> Version number needed.  OpenCores wanted "projectname-rtlsvn###"
> where ### is the SVN commit number of the RTL directory in the
> project's source repository.
> 

That will also require a change to the driver.

Using svn commit ids as version info seems a bit too fine grained to me,
but if that's what's agreed on, then it should be the commit id from the
projects official repository at opencores.org I think.

Stefan
