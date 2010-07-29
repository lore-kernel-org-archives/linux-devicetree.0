From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [patch] nouveau: unwind on load errors
Date: Thu, 29 Jul 2010 21:39:48 +0200
Message-ID: <20100729193948.GA4821@joi.lan>
References: <20100729180231.GV26313@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20100729180231.GV26313@bicker>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Dan Carpenter <error27@gmail.com>
Cc: nouveau@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Grant Likely <grant.likely@secretlab.ca>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 29, 2010 at 08:02:31PM +0200, Dan Carpenter wrote:
> nouveau_load() just returned directly if there was an error instead of
> releasing resources.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Patch looks good, but could you base it on top of nouveau tree? 

git://anongit.freedesktop.org/nouveau/linux-2.6

Marcin
