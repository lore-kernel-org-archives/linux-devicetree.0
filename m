From: Jon Loeliger <jdl@jdl.com>
Subject: Re: libfdt: Add function to explicitly expand aliases
Date: Thu, 02 Oct 2008 08:55:28 -0500
Message-ID: <E1KlOeO-0007Dw-95@jdl.com>
References: <20080820065514.GA18996@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-reply-to: <20080820065514.GA18996@yookeroo.seuss> 
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: David Gibson <david@gibson.dropbear.id.au>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

> Kumar has already added alias expansion to fdt_path_offset().
> However, in some circumstances it may be convenient for the user of
> libfdt to explicitly get the string expansion of an alias.  This patch
> adds a function to do this, fdt_get_alias(), and uses it to implement
> fdt_path_offset().
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Applied.

jdl
