From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: [PATCH 0/4] Merge OF dynamic patches
Date: Tue, 17 Nov 2009 15:04:02 -0600
Message-ID: <4B030FC2.9070401@austin.ibm.com>
Reply-To: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org>
Sender: owner-microblaze-uclinux-FR6EJeJVuqfA6Z3fQjNZrN9u6TNh0Fb7@public.gmane.org
To: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This set of patches merges the common dynamic device tree
updating routines of_attach_node() and of_detach_node() to
drivers/of/of_dynamic.c.

Built and tested on powerpc, I have no access to build/test
this on microblaze.

-Nathan Fontenot

1/4 - Merge of_attach_node
2/4 - Merge of_detach_node
3/4 - Makefile/Kconfig updates
4/4 - Move declarations to linux/of.h
